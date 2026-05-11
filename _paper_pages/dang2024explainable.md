---
paper_key: dang2024explainable
bibtex_display_key: dang2024explainable
hero_venue: arXiv 2024
hero_authors_html: >-
  Yunkai Dang<sup>*</sup>, Kaichen Huang<sup>*</sup>, Jiahao Huo<sup>*</sup>,
  Yibo Yan, Sirui Huang, Dongrui Liu, Mengxi Gao, Jie Zhang, Chen Qian,
  Kun Wang, Yong Liu, Jing Shao, Hui Xiong, Xuming Hu<sup>&dagger;</sup>
hero_author_note: >-
  <sup>*</sup> Equal contribution. <sup>&dagger;</sup> Corresponding author:
  xuminghu@hkust-gz.edu.cn.
hero_highlights:
  - icon: search
    title: Structured Map Of MLLM Explainability
    text: The survey organizes methods, benchmarks, and applications into a coherent landscape instead of a loose paper list.
  - icon: sitemap
    title: Data, Model, And Inference Perspectives
    text: It frames interpretability from the viewpoints of data, model internals, and training or inference behavior.
  - icon: balance-scale
    title: Evaluation Standards Still Lag Behind
    text: The paper highlights that faithful, useful, and robust explanation evaluation remains a major open problem.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2412.02104
    icon: paper
---

<style>
/* Edit these values directly in this Markdown file. */
.paper-page .paper-title { font-size: 2rem; }
.paper-page .paper-authors { font-size: 1.5rem; }
.paper-page .paper-venue { font-size: 1.42rem; }
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

## Overview

This survey addresses a problem that becomes more urgent as multimodal large language models become more capable: their decisions are harder to inspect, debug, and justify. MLLMs can already solve a wide range of tasks across image-text generation, visual question answering, retrieval, and multimodal reasoning, but the mechanisms behind those outputs often remain opaque. The survey is motivated by the view that performance alone is not enough; <span class="paper-key">interpretability and explainability</span> are necessary if these systems are to be trusted in high-stakes settings.

Rather than listing papers loosely, the survey builds a <span class="paper-key">structured map of the field</span>. It covers explainability methods, benchmark design, evaluation protocols, and open challenges across model architectures, training procedures, and inference strategies.

## Survey Scope

The paper organizes the literature from <span class="paper-key">three main perspectives</span>: <span class="paper-key">data</span>, <span class="paper-key">model</span>, and <span class="paper-key">training or inference</span>. It also examines interpretability at multiple granularities, from token-level interactions to embedding-level representations and higher-level module behavior. In addition to analysis tools, the survey covers architecture design choices, alignment methods, hallucination-oriented explanation work, robustness benchmarks, and application-specific interpretability studies.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 880px;">
    <img src="/assets/img/publication_preview/survery_explain.png" alt="Explainable and interpretable MLLMs survey overview">
    <p class="project-caption">The survey organizes MLLM explainability research across data, model, and training or inference dimensions, while also covering benchmarks and applications.</p>
  </div>
</div>

<p><i class="fas fa-search paper-inline-icon"></i><span class="paper-key">Explainability Challenge:</span> as multimodal large language models become more capable, their decisions become harder to inspect, debug, and justify.</p>

<p><i class="fas fa-sitemap paper-inline-icon"></i><span class="paper-key">Three-Perspective Framework:</span> the survey organizes the literature from the viewpoints of <span class="paper-key">data</span>, <span class="paper-key">model</span>, and <span class="paper-key">training or inference</span>.</p>

<p><i class="fas fa-balance-scale paper-inline-icon"></i><span class="paper-key">Evaluation Gap:</span> the paper emphasizes that the field still lacks strong standards for measuring whether an explanation is faithful, useful, and robust.</p>

<div class="project-grid project-grid-2">
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-book paper-inline-icon"></i><span class="paper-key">Survey Value:</span> this work acts as infrastructure for the area by giving researchers a structured map of methods, benchmarks, and open problems.</p>
  </div>
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-file-alt paper-inline-icon"></i><span class="paper-key">Paper Resource:</span> the full survey is available on <a href="https://arxiv.org/pdf/2412.02104"><i class="ai ai-arxiv paper-inline-icon" style="margin-left:0.3rem;margin-right:0.3rem;"></i>arXiv</a>.</p>
  </div>
</div>

This is not a paper list dressed up as a survey. Its main value is that it gives the field a <span class="paper-key">common explanatory framework</span> for understanding where interpretability tools work, where they fail, and where evaluation is still too weak.

## Main Takeaways

- The explainability landscape is broader than <span class="paper-key">attention visualization alone</span>. The survey covers attribution methods, representation analysis, architecture-level interventions, reward and alignment strategies, and hallucination-oriented diagnosis.
- <span class="paper-key">Benchmarking remains a major bottleneck</span>. The paper emphasizes that explanation quality needs better evaluation protocols, especially when explanations are used for trust, debugging, or alignment rather than only for qualitative inspection.
- Token-level and representation-level analysis are both important. The survey highlights that MLLM behavior cannot be understood from one level alone because multimodal reasoning mixes <span class="paper-key">visual grounding</span>, <span class="paper-key">language priors</span>, and <span class="paper-key">cross-modal fusion</span>.
- The field still lacks widely accepted standards for measuring whether an explanation is <span class="paper-key">faithful, useful, and robust</span> under real deployment constraints.

## Why This Survey Matters

This paper is valuable less as a single algorithm and more as <span class="paper-key">infrastructure for the research area</span>. It gives researchers a common vocabulary for discussing explainability in MLLMs and helps separate what is already mature from what is still poorly understood.

For practitioners, the survey is useful because it makes clear that transparency is not one technique but a stack of decisions: dataset design, representation learning, model architecture, alignment, decoding, and post-hoc analysis all interact. If the goal is more accountable multimodal AI, this survey is a strong starting point.
