---
paper_key: dang2025uhrrs-mllm-benchmark
bibtex_display_key: dang2025uhrrsbench
hero_venue: arXiv 2025
hero_authors_html: >-
  Yunkai Dang<sup>*</sup>, Meiyi Zhu<sup>*</sup>, Donghao Wang,
  Yizhuo Zhang, Jiacheng Yang, Qi Fan, Yuekun Yang,
  Wenbin Li<sup>&dagger;</sup>, Feng Miao, Yang Gao
hero_author_note: >-
  <sup>*</sup> Equal contribution. <sup>&dagger;</sup> Corresponding author.
  Correspondence to: yunkaidang@smail.nju.edu.cn, liwenbin@nju.edu.cn.
hero_affiliations:
  - name: Reasoning and Learning Research Group
    logo: /assets/img/icons/rlmind.png
    show_name: false
  - name: Nanjing University
    url: https://www.nju.edu.cn/en/
    logo: /assets/img/icons/nju.png
    show_name: false
hero_highlights:
  - icon: image
    title: 5,329 Ultra-High-Resolution Scenes
    text: RSHR-Bench is built from full-scene remote sensing images with long sides of at least 4,000 pixels and much stricter visual requirements.
  - icon: shield-alt
    title: Language-Prior Resistant Evaluation
    text: The benchmark uses adversarial filtering and human verification to reduce shortcut answers that strong text-only LLMs can exploit.
  - icon: comments
    title: Perception, Reasoning, and Multi-Turn
    text: It evaluates not only single-turn VQA but also captioning, open-ended reasoning, and multi-turn interaction in super-high-resolution settings.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2512.17319
    icon: paper
  - label: RSHR Benchmark
    url: https://github.com/Yunkaidang/RSHR
    icon: benchmark
  - label: RL-MIND
    url: https://github.com/RL-MIND
    icon: github
  - label: RL-MIND
    url: https://huggingface.co/RL-MIND
    icon: huggingface
---

<style>
/* Edit these values directly in this Markdown file. */
.paper-page .paper-title { font-size: 2rem; }
.paper-page .paper-authors { font-size: 1.5rem; }
.paper-page .paper-venue { font-size: 1.42rem; }
.paper-page .paper-affiliation-logo { height: 3.5rem; }
.paper-page .paper-highlight-icon { width: 3.25rem; height: 3.25rem; }
.paper-page .paper-highlight-icon img { height: 1.85rem; }
.paper-page .paper-visual,
.paper-page .paper-section { max-width: 1080px; }
.paper-page .paper-visual { --paper-hero-image-max-width: 980px; }
.paper-page .paper-visual img { max-width: min(100%, var(--paper-hero-image-max-width, 980px)); margin: 0 auto; width: 100%; }
.paper-page .paper-custom-content {
  --project-grid-gap: 1rem;
  --project-media-max-width: 100%;
  --project-image-width: 100%;
  --project-image-max-width: 100%;
  font-size: 1.05rem;
}
.paper-page .paper-custom-content h2 { font-size: 1.8rem; }
.paper-page .paper-custom-content h3 { font-size: 1.3rem; }
.paper-page .paper-custom-content p,
.paper-page .paper-custom-content li { font-size: 1.05rem; line-height: 1.8; }
.paper-page .paper-custom-content .project-grid { max-width: 980px; margin-left: auto; margin-right: auto; }
.paper-page .paper-custom-content .project-media img { max-width: min(100%, var(--project-image-max-width, 100%)); width: min(100%, var(--project-image-width, 100%)); margin: 0 auto; }
.paper-page .paper-custom-content .project-caption { font-size: 0.92rem; }
</style>

## Project Overview

<span class="paper-key">RSHR-Bench</span> is built around a direct critique of current remote sensing multimodal evaluation: many benchmarks appear to test visual reasoning, but in practice a strong text-only LLM can sometimes answer a large fraction of the questions without seeing the image at all. That means benchmark scores can exaggerate visual understanding and understate the role of <span class="paper-key">language priors</span>.

The paper introduces a new benchmark for <span class="paper-key">ultra-high-resolution remote sensing MLLMs</span> where the images are large, the tasks are more interaction-heavy, and the annotation pipeline explicitly tries to reduce answer shortcuts. The benchmark is designed to test whether a model can connect high-resolution visual evidence to perception, reasoning, and multi-turn interaction.

## Benchmark Design

RSHR-Bench contains <span class="paper-metric">5,329</span> full-scene remote sensing images with a long side of at least <span class="paper-metric">4,000 pixels</span>, with some scenes reaching roughly <span class="paper-metric">3 × 10^8</span> pixels. It includes <span class="paper-metric">3,864</span> VQA tasks, <span class="paper-metric">3,913</span> image captioning tasks, and <span class="paper-metric">500</span> fully human-written or human-verified single-image evaluation pairs. The benchmark spans multiple-choice VQA, open-ended VQA, image captioning, and single-image evaluation, and covers <span class="paper-key">nine perception categories</span> together with <span class="paper-key">four reasoning types</span>.

<div class="project-media" style="--project-image-max-width: 860px;">
    <img src="/assets/img/publication_preview/RSHR.png" alt="RSHR benchmark overview">
    <p class="project-caption">RSHR-Bench is designed to evaluate visual understanding on genuinely large remote sensing scenes rather than low-resolution shortcuts.</p>
</div>

<p><i class="fas fa-shield-alt paper-inline-icon"></i><span class="paper-key">Language-Prior Resistance:</span> RSHR-Bench is explicitly designed to reduce shortcut answers that strong text-only models can exploit without seeing the image.</p>

<p><i class="fas fa-image paper-inline-icon"></i><span class="paper-key">Ultra-High-Resolution Scale:</span> the benchmark contains <span class="paper-metric">5,329</span> full-scene images, with long sides of at least <span class="paper-metric">4,000</span> pixels and scenes reaching roughly <span class="paper-metric">3 × 10^8</span> pixels.</p>

<p><i class="fas fa-comments paper-inline-icon"></i><span class="paper-key">Task Diversity:</span> it evaluates multiple-choice VQA, open-ended VQA, captioning, and single-image evaluation across perception, reasoning, and multi-turn interaction.</p>

<div class="project-grid project-grid-2">
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-brain paper-inline-icon"></i><span class="paper-key">Key Finding:</span> text-only models can still reach <span class="paper-metric">51.6%</span> reasoning accuracy on XLRS-Bench, showing why stricter visual evaluation is necessary.</p>
  </div>
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-file-alt paper-inline-icon"></i><span class="paper-key">Paper Resource:</span> the benchmark design and evaluation details are available on <a href="https://arxiv.org/pdf/2512.17319"><i class="ai ai-arxiv paper-inline-icon" style="margin-left:0.3rem;margin-right:0.3rem;"></i>arXiv</a>.</p>
  </div>
</div>

## Main Empirical Findings

- On the remote-sensing subset of MME-RealWorld, a text-only Llama3-8B model still answers <span class="paper-metric">31.22%</span> of the questions correctly after the image is removed. This directly shows that some existing tasks remain solvable through priors rather than vision.
- On XLRS-Bench, the issue becomes even more obvious: text-only Qwen3-8B reaches <span class="paper-metric">51.6%</span> average reasoning accuracy, surpassing the image-conditioned GPT-4o baseline at <span class="paper-metric">45.2%</span>. The same text-only model reaches <span class="paper-metric">72.0%</span> on anomaly detection and <span class="paper-metric">77.0%</span> on existence-and-counting reasoning, while text-only Llama3-8B achieves <span class="paper-metric">48.0%</span> on route planning.
- On RSHR-Bench itself, the paper reports that open-source models mostly remain around <span class="paper-metric">25%</span> accuracy on reasoning, indicating that the new benchmark is substantially more demanding than many earlier datasets. Among open-source systems, VILA-HD is highlighted as notably stronger on reasoning, reaching an average of <span class="paper-metric">58.0</span> in the reported setting.
- Captioning performance remains low even for strong closed-source models. For example, GPT-4o-mini achieves the best overall caption metrics in the main comparison, but the reported BLEU-4 is still only <span class="paper-metric">4.8</span>. This is a useful signal that the benchmark is not easy to game with generic language fluency alone.

## Why This Benchmark Matters

A useful benchmark should measure the capability we care about, not just the ability to exploit annotation artifacts. <span class="paper-key">RSHR-Bench</span> matters because it makes that distinction explicit. It is <span class="paper-key">large enough, high-resolution enough, and carefully filtered enough</span> to expose whether a model is actually using the image.

For future remote sensing MLLMs, this benchmark is valuable both as an evaluation tool and as a design pressure. It favors models that can preserve fine-grained visual grounding over long contexts and discourages systems that rely too heavily on language priors.
