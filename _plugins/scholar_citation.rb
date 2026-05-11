require 'citeproc'
require 'csl/styles'
require 'bibtex'

module Jekyll
  module ScholarCitation
    def scholar_citation_from_key(key, style = 'apa', locale = 'en')
      return '' if key.to_s.strip.empty?

      site = @context.registers[:site]
      bibliography_name = site.config.dig('scholar', 'bibliography') || 'papers.bib'
      bibliography_path = File.join(site.source, '_bibliography', bibliography_name)
      bibliography = scholar_bibliography_cache[bibliography_path] ||= BibTeX::Bibliography.parse(File.read(bibliography_path))
      entry = bibliography[key.to_s]
      return '' if entry.nil?

      citeproc_item = entry.to_citeproc
      citation_id =
        if citeproc_item.respond_to?(:[])
          citeproc_item['id'] || citeproc_item[:id]
        end

      processor = CiteProc::Processor.new(style: style, format: 'html', locale: locale)
      processor.import [citeproc_item]
      rendered =
        if citation_id
          processor.render(:bibliography, id: citation_id)
        else
          processor.render(:bibliography)
        end

      Array(rendered).join("\n").strip
    rescue StandardError => e
      Jekyll.logger.warn('scholar_citation:', "#{style} failed for #{key} (#{e.message})")
      ''
    end

    def scholar_bibtex_from_key(key, display_key = nil)
      return '' if key.to_s.strip.empty?

      site = @context.registers[:site]
      bibliography_name = site.config.dig('scholar', 'bibliography') || 'papers.bib'
      bibliography_path = File.join(site.source, '_bibliography', bibliography_name)
      bibliography = scholar_bibliography_cache[bibliography_path] ||= BibTeX::Bibliography.parse(File.read(bibliography_path))
      entry = bibliography[key.to_s]
      return '' if entry.nil?

      entry_type = scholar_bibtex_type(entry)
      venue_field, venue_value = scholar_bibtex_venue(entry, entry_type)

      fields = []
      fields << ['title', scholar_bibtex_value(entry['title'])]
      fields << ['author', scholar_bibtex_value(entry['author'])]
      fields << [venue_field, scholar_bibtex_value(venue_value)] if venue_field && venue_value
      fields << ['year', scholar_bibtex_value(entry['year'])]

      body =
        fields.compact.filter_map do |field_name, field_value|
          next if field_name.to_s.strip.empty? || field_value.to_s.strip.empty?

          [field_name, field_value]
        end

      rendered_key = display_key.to_s.strip
      rendered_key = entry.key if rendered_key.empty?

      lines = ["@#{entry_type}{#{rendered_key},"]
      body.each_with_index do |(field_name, field_value), index|
        suffix = index == body.length - 1 ? '' : ','
        lines << "  #{field_name}={#{field_value}}#{suffix}"
      end
      lines << '}'
      lines.join("\n")
    rescue StandardError => e
      Jekyll.logger.warn('scholar_citation:', "bibtex failed for #{key} (#{e.message})")
      ''
    end

    private

    def scholar_bibliography_cache
      @scholar_bibliography_cache ||= {}
    end

    def scholar_bibtex_type(entry)
      return 'article' if scholar_bibtex_value(entry['arxiv']).to_s.strip != ''

      entry_type = entry.type.to_s.strip.downcase
      entry_type.empty? ? 'article' : entry_type
    end

    def scholar_bibtex_venue(entry, entry_type)
      arxiv_id = scholar_bibtex_value(entry['arxiv']).to_s.strip
      return ['journal', "arXiv preprint arXiv:#{arxiv_id}"] unless arxiv_id.empty?

      journal = scholar_bibtex_value(entry['journal']).to_s.strip
      return ['journal', journal] unless journal.empty?

      booktitle = scholar_bibtex_value(entry['booktitle']).to_s.strip
      return ['booktitle', booktitle] unless booktitle.empty?

      school = scholar_bibtex_value(entry['school']).to_s.strip
      if %w[phdthesis mastersthesis thesis].include?(entry_type) && !school.empty?
        return ['school', school]
      end

      ['', '']
    end

    def scholar_bibtex_value(value)
      value.to_s.gsub(/\s+/, ' ').strip
    end
  end
end

Liquid::Template.register_filter(Jekyll::ScholarCitation)
