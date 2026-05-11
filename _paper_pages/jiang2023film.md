---
paper_key: jiang2023film
bibtex_display_key: jiang2023film
hero_venue: arXiv 2023
hero_authors_html: >-
  Zihao Jiang, Yunkai Dang, Dong Pang, Huishuai Zhang, Weiran Huang
hero_highlights:
  - icon: language
    title: Language-Guided Few-Shot Learning
    text: FILM uses pretrained language-model semantics as a core signal for few-shot classification instead of a light auxiliary prior.
  - icon: balance-scale
    title: Adaptive Visual-Text Metric
    text: A learned metric and bi-level optimization improve how visual evidence and textual class semantics are compared across episodes.
  - icon: chart-line
    title: Consistent Gains Across Benchmarks
    text: The method reports clear improvements on miniImageNet, tieredImageNet, CIFAR-FS, and CUB in both 1-shot and 5-shot settings.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2307.04114
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

FILM asks how few-shot image classification can benefit more substantially from pre-trained language models. Earlier methods often use semantic information from class names, but only as a lightweight auxiliary cue added to otherwise standard few-shot pipelines. FILM instead treats <span class="paper-key">language-derived semantic structure</span> as a central component of the classifier design.

The paper proposes a <span class="paper-key">contrastive few-shot learning framework</span> that aligns visual features and language-model embeddings more carefully. The goal is better transferability to novel classes, especially when only one or a few labeled examples are available.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 860px;">
    <img src="/assets/img/publication_preview/few-shot.png" alt="FILM overview">
    <p class="project-caption">FILM integrates pre-trained language-model semantics directly into the few-shot matching process.</p>
  </div>
</div>

<p><i class="fas fa-language paper-inline-icon"></i><span class="paper-key">Language-Guided Few-Shot Learning:</span> FILM treats class semantics from pretrained language models as a core transfer signal rather than a weak auxiliary hint.</p>

<p><i class="fas fa-balance-scale paper-inline-icon"></i><span class="paper-key">Adaptive Visual-Text Metric:</span> the model learns a comparison function that goes beyond cosine similarity so support and query images can be matched with textual semantics more flexibly.</p>

<p><i class="fas fa-sync-alt paper-inline-icon"></i><span class="paper-key">Task-Adaptive Meta Optimization:</span> MAML-style bi-level training allows the metric to adapt to each few-shot episode instead of staying fixed across tasks.</p>

<div class="project-grid project-grid-2">
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-chart-line paper-inline-icon"></i><span class="paper-key">Benchmark Gain:</span> FILM improves miniImageNet by <span class="paper-metric">+2.42%</span> and <span class="paper-metric">+4.41%</span>, and tieredImageNet by <span class="paper-metric">+3.88%</span> and <span class="paper-metric">+4.41%</span> in 1-shot and 5-shot settings.</p>
  </div>
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-file-alt paper-inline-icon"></i><span class="paper-key">Paper Resource:</span> the full method and experiments are available on <a href="https://arxiv.org/pdf/2307.04114"><i class="ai ai-arxiv paper-inline-icon" style="margin-left:0.3rem;margin-right:0.3rem;"></i>arXiv</a>.</p>
  </div>
</div>

This is not simply a language-augmented prototype classifier. The paper is really about building a <span class="paper-key">better transfer metric</span> between vision and language so that few-shot recognition can exploit semantic priors without collapsing into brittle label-name matching.

## Method Pipeline

FILM introduces a textual branch that is specifically designed to align with visual representations extracted from few-shot episodes. A learned metric module then generalizes cosine similarity so that the model can compare visual and textual information more flexibly. To improve adaptation across tasks, the method is trained with MAML-style bi-level optimization, allowing the metric to adjust to new few-shot episodes rather than staying fixed.

## Main Experimental Results

- On miniImageNet, FILM improves over prior few-shot methods that use class-name semantics by <span class="paper-metric">2.42%</span> in the 1-shot setting and <span class="paper-metric">4.41%</span> in the 5-shot setting.
- On tieredImageNet, the paper reports gains of <span class="paper-metric">3.88%</span> and <span class="paper-metric">4.41%</span> over AM3 in 1-shot and 5-shot settings, respectively.
- On CIFAR-FS, FILM outperforms MetaOptNet by <span class="paper-metric">4.99%</span> in the 1-shot setting and <span class="paper-metric">3.06%</span> in the 5-shot setting.
- On CUB, the paper reports that FILM surpasses all compared methods, including the previous best-performing RE-Net baseline.
- The cross-domain and ablation analyses further support the main design choice: better language-visual alignment and a more adaptive metric are both important contributors to the final gains.

## Why These Results Matter

FILM is valuable because it does not treat language as an afterthought. It shows that pre-trained language models can serve as a structured semantic prior for low-data visual recognition, especially when the alignment mechanism is designed carefully.

The larger takeaway is that few-shot recognition can benefit from foundation-model semantics, but only if the model learns how to compare visual and textual information in a task-adaptive way. FILM is an early and still useful example of that design principle.
