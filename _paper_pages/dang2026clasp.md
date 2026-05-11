---
paper_key: dang2026clasp
bibtex_display_key: dang2026clasp
hero_venue: arXiv 2026
hero_authors_html: >-
  Yunkai Dang<sup>*</sup>, Yizhu Jiang<sup>*</sup>, Yifan Jiang, Qi Fan,
  Yinghuan Shi, Wenbin Li<sup>&dagger;</sup>, Yang Gao
hero_author_note: >-
  <sup>*</sup> Equal contribution. <sup>&dagger;</sup> Corresponding author.
  Correspondence to: liwenbin.nju@gmail.com, yunkaidang1@gmail.com.
hero_affiliations:
  - name: Reasoning and Learning Research Group
    logo: /assets/img/icons/rlmind.png
    show_name: false
  - name: Nanjing University
    url: https://www.nju.edu.cn/en/
    logo: /assets/img/icons/nju.png
    show_name: false
hero_highlights:
  - icon: stream
    title: Class-Adaptive Layer Fusion
    text: CLASP fuses multi-layer vision features according to the instruction category instead of relying on a fixed single-layer token representation.
  - icon: compress-arrows-alt
    title: Dual-Stage Visual Token Pruning
    text: The pruning budget is split between relevance-preserving pivot tokens and coverage-preserving completion tokens for more robust compression.
  - icon: tachometer-alt
    title: 94.7% Performance at 88.9% Pruning
    text: Under very aggressive compression, CLASP still preserves 94.7% of the original performance and remains strong across multiple MLLM backbones.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2604.12767
    icon: paper
  - label: RL-MIND
    url: https://github.com/RL-MIND
    icon: github
  - label: RL-MIND
    url: https://huggingface.co/RL-MIND
    icon: huggingface
  - label: Code (Coming Soon)
    icon: github
    disabled: true
  - label: Weights (Coming Soon)
    icon: huggingface
    disabled: true
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

<span class="paper-key">CLASP</span> studies one of the most persistent efficiency problems in multimodal large language models: <span class="paper-key">visual token redundancy</span>. Existing pruning methods often rely on a single vision layer and a fixed pruning rule, which makes them brittle when the prompt changes or when the task requires a different balance between local detail and global coverage. CLASP addresses this by making both the feature construction stage and the pruning stage <span class="paper-key">adaptive to the semantic class of the instruction</span>.

The core argument of the paper is simple but important: if different prompt types need different visual evidence, then fixed token reduction strategies will inevitably waste budget on the wrong patches or over-prune critical details. CLASP turns token reduction into a prompt-conditioned decision process instead of a one-size-fits-all heuristic.

## Method Pipeline

The framework first fuses multiple vision encoder layers to construct <span class="paper-key">category-aware visual representations</span> instead of depending on a single-layer feature map. It then performs <span class="paper-key">dual-stage pruning</span>. In the first stage, attention-salient pivot tokens preserve relevance to the instruction. In the second stage, redundancy-aware completion tokens maintain coverage over the scene. This design aims to preserve both “what matters most” and “what would otherwise be lost.”

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 880px;">
    <img src="/assets/img/publication_preview/CLASP.png" alt="CLASP overview">
    <p class="project-caption">CLASP combines class-adaptive feature fusion with dual-stage pruning to reduce visual tokens without collapsing task robustness.</p>
  </div>
</div>

<p><i class="fas fa-compress-arrows-alt paper-inline-icon"></i><span class="paper-key">Visual Token Redundancy:</span> CLASP targets the heavy computational overhead caused by long visual token sequences in multimodal large language models.</p>

<p><i class="fas fa-stream paper-inline-icon"></i><span class="paper-key">Class-Adaptive Layer Fusion:</span> the framework builds category-specific visual representations instead of relying on a fixed single-layer feature map.</p>

<p><i class="fas fa-filter paper-inline-icon"></i><span class="paper-key">Dual-Stage Pruning:</span> attention-salient pivot tokens preserve relevance, while redundancy-aware completion tokens maintain coverage over the full scene.</p>

<div class="project-grid project-grid-2">
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-chart-line paper-inline-icon"></i><span class="paper-key">Aggressive Compression:</span> CLASP still preserves <span class="paper-metric">94.7%</span> normalized performance at <span class="paper-metric">88.9%</span> pruning.</p>
  </div>
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-file-alt paper-inline-icon"></i><span class="paper-key">Paper Resource:</span> the full method and experiments are available on <a href="https://arxiv.org/pdf/2604.12767"><i class="ai ai-arxiv paper-inline-icon" style="margin-left:0.3rem;margin-right:0.3rem;"></i>arXiv</a>.</p>
  </div>
</div>

## Main Experimental Results

- On LLaVA-v1.5-7B, CLASP achieves the best normalized average at all three tested budgets: <span class="paper-metric">98.4</span> with 192 retained tokens, <span class="paper-metric">97.0</span> with 128 tokens, and <span class="paper-metric">94.7</span> with only 64 tokens. These settings correspond to token reductions of <span class="paper-metric">66.7%</span>, <span class="paper-metric">77.8%</span>, and <span class="paper-metric">88.9%</span>.
- At 192 tokens, the method keeps <span class="paper-metric">98.4%</span> of the original performance and reaches the strongest GQA score reported in the comparison, <span class="paper-metric">60.4</span>, while outperforming classical reduction baselines by large margins such as <span class="paper-metric">+9.9</span> over ToMe and <span class="paper-metric">+10.6</span> over FastV.
- At 128 tokens, CLASP attains the best <span class="paper-key">POPE</span> score of <span class="paper-metric">85.2</span>, which is especially relevant for faithfulness and object hallucination evaluation under tighter budgets.
- Even at 64 tokens, CLASP still preserves <span class="paper-metric">94.7%</span> of the original performance and beats the similarity-based DART baseline by <span class="paper-metric">+1.7</span>, showing that the method remains stable in very aggressive pruning regimes.
- On higher-resolution LLaVA-NeXT-7B with 320 retained tokens, the paper reports a normalized average of <span class="paper-metric">95.2</span>, improving over DART by <span class="paper-metric">+1.3</span> and over HiRED by <span class="paper-metric">+1.9</span>. It also records strong task scores including <span class="paper-metric">62.7</span> GQA, <span class="paper-metric">1723</span> MME, <span class="paper-metric">85.8</span> POPE, and <span class="paper-metric">61.7</span> TextVQA.
- The Qwen2.5-VL-7B results show that the method transfers beyond LLaVA: at <span class="paper-metric">66.7%</span> pruning, the normalized average improves from <span class="paper-metric">94.1</span> to <span class="paper-metric">96.5</span> over SparseVLM, and at <span class="paper-metric">77.8%</span> pruning it improves from <span class="paper-metric">90.8</span> to <span class="paper-metric">94.4</span>.

## Why These Results Matter

CLASP is useful because it frames efficiency as a <span class="paper-key">conditional modeling problem</span> rather than a hard-coded compression rule. That is a better fit for real multimodal systems, where the visual evidence needed for OCR, counting, grounding, or open-ended reasoning can be very different.

The practical implication is that token pruning does not have to be a crude tradeoff between speed and quality. With prompt-conditioned fusion and budget allocation, a model can cut most of the visual sequence while still preserving the evidence required for robust inference.
