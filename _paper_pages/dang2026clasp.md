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
  - label: CLASP Code
    url: https://github.com/Yunkaidang/CLASP
    icon: github
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
.paper-inline-icon {
  color: #0f83a7;
  font-size: 1.05rem;
  margin-right: 0.45rem;
}
.paper-inline-logo {
  height: 1.15rem;
  margin-right: 0.4rem;
  vertical-align: -0.16rem;
}
</style>

## Overview

Multimodal Large Language Models (MLLMs) often serialize images into long patch-token sequences, creating heavy memory and latency costs during inference. Existing token reduction methods usually rely on <span class="paper-key">single-layer ViT features</span> and <span class="paper-key">static pruning rules</span>, which can be brittle when different instructions require different evidence, such as OCR details, object attributes, counting targets, spatial relations, or scene-level context. In this paper, <span class="paper-key">we propose CLASP, a plug-and-play token reduction framework that combines class-adaptive layer fusion with class-adaptive dual-stage pruning</span>.

The core idea is that visual token pruning should be conditioned on the <span class="paper-key">semantic class of the instruction</span>. CLASP first routes the prompt to a question category, then uses that category to choose how vision-layer features are fused and how the token budget is split between relevance and coverage. This turns token reduction from a fixed heuristic into a prompt-conditioned decision process.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 820px;">
    <img src="/assets/img/publication_preview/CLASP.png" alt="Per-benchmark performance under increasing token pruning">
    <p class="project-caption"><span class="paper-key">Performance Under Pruning.</span> Across eight evaluation suites, CLASP degrades more slowly than representative pruning baselines and stays closer to the unpruned upper bound, especially under aggressive pruning ratios.</p>
  </div>
</div>

<p><i class="fas fa-compress-arrows-alt paper-inline-icon"></i><span class="paper-key">Visual Token Redundancy:</span> CLASP targets the quadratic attention cost and latency overhead caused by long visual token sequences in MLLMs.</p>

<p><i class="fas fa-stream paper-inline-icon"></i><span class="paper-key">Class-Adaptive Layer Fusion:</span> The framework fuses multi-layer ViT features using category-specific weights instead of depending on a fixed single-layer representation.</p>

<p><i class="fas fa-filter paper-inline-icon"></i><span class="paper-key">Dual-Stage Pruning:</span> The pruning budget is dynamically split between attention-salient pivot tokens for relevance and redundancy-aware completion tokens for coverage.</p>

<p><i class="fas fa-tachometer-alt paper-inline-icon"></i><span class="paper-key">Plug-and-Play Efficiency:</span> CLASP requires no retraining and can be integrated into multiple MLLM backbones for image and video inference.</p>

## Method Pipeline

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 960px;">
    <img src="/assets/img/publication_preview/CLASP/Method.png" alt="CLASP method overview">
    <p class="project-caption"><span class="paper-key">Method Overview.</span> CLASP uses a prompt-to-class router to condition visual processing on textual intent. It first performs <span class="paper-key">class-adaptive layer fusion</span>, aggregating ViT features from multiple layers with class-specific mixture weights. It then applies <span class="paper-key">class-adaptive pruning</span>, splitting the retained token budget between attention-based selection and similarity-based clustering.</p>
  </div>
</div>

Given a prompt and an input image, CLASP aims to keep a target visual token budget <span class="paper-key">R</span> while preserving instruction-critical content and broad visual coverage. A lightweight text router maps the prompt to a category. The category then controls two decisions: the layer-mixture weights used to form the visual representation and the split ratio used during pruning.

The first pruning stage keeps <span class="paper-key">attention-salient pivot tokens</span>, which protect the most query-relevant visual evidence. The second stage uses <span class="paper-key">redundancy-aware clustering</span> to add completion tokens that are weakly covered by the pivot set, improving scene coverage without wasting budget on near-duplicate patches. In practice, the paper applies this as a progressive pruning schedule at decoder layers <span class="paper-key">2</span>, <span class="paper-key">6</span>, and <span class="paper-key">15</span>.

## Main Experimental Results

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 820px;">
    <img src="/assets/img/publication_preview/CLASP/Experiment.png" alt="LLaVA-v1.5-7B benchmark comparison">
    <p class="project-caption"><span class="paper-key">LLaVA-v1.5-7B Results.</span> CLASP reports the best normalized average at all three tested retained-token budgets: <span class="paper-metric">98.4%</span> at 192 tokens, <span class="paper-metric">97.0%</span> at 128 tokens, and <span class="paper-metric">94.7%</span> at 64 tokens.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 820px;">
    <img src="/assets/img/publication_preview/CLASP/performance.png" alt="Per-benchmark performance curves">
    <p class="project-caption"><span class="paper-key">Per-Benchmark Curves.</span> Compared with SparseVLM and PDrop, CLASP maintains stronger results across MME, GQA, MMVet, POPE, TextVQA, VQAv2, SQA, and MMB as pruning becomes more aggressive.</p>
  </div>
</div>

- On <span class="paper-key">LLaVA-v1.5-7B</span>, CLASP achieves the best normalized average at all three tested budgets: <span class="paper-metric">98.4%</span> with 192 retained tokens, <span class="paper-metric">97.0%</span> with 128 tokens, and <span class="paper-metric">94.7%</span> with only 64 tokens. These correspond to visual token reductions of <span class="paper-metric">66.7%</span>, <span class="paper-metric">77.8%</span>, and <span class="paper-metric">88.9%</span>.
- At <span class="paper-key">192 tokens</span>, CLASP reaches the strongest GQA score in the comparison, <span class="paper-metric">60.4</span>, and records the highest normalized average of <span class="paper-metric">98.4%</span>, outperforming DART by <span class="paper-metric">+0.3</span> and VisionZip by <span class="paper-metric">+0.3</span>.
- At <span class="paper-key">128 tokens</span>, CLASP keeps <span class="paper-metric">97.0%</span> of the original performance and achieves the best POPE score of <span class="paper-metric">85.2</span>, indicating strong faithfulness under tighter visual budgets.
- At <span class="paper-key">64 tokens</span>, CLASP still preserves <span class="paper-metric">94.7%</span> normalized performance. This is <span class="paper-metric">+1.7</span> over DART and <span class="paper-metric">+1.9</span> over VisionZip under the same aggressive <span class="paper-metric">88.9%</span> pruning ratio.
- On <span class="paper-key">LLaVA-NeXT-7B</span> with 320 retained tokens, CLASP reports a normalized average of <span class="paper-metric">95.2%</span>, improving over DART by <span class="paper-metric">+1.3</span> and HiRED by <span class="paper-metric">+1.9</span>. It also records strong task scores including <span class="paper-metric">62.7</span> GQA, <span class="paper-metric">1723</span> MME, <span class="paper-metric">85.8</span> POPE, and <span class="paper-metric">61.7</span> TextVQA.
- On <span class="paper-key">Qwen2.5-VL-7B</span>, CLASP transfers beyond the LLaVA family. Compared with SparseVLM, the normalized average rises from <span class="paper-metric">94.1%</span> to <span class="paper-metric">96.5%</span> at <span class="paper-metric">66.7%</span> pruning, from <span class="paper-metric">90.8%</span> to <span class="paper-metric">94.4%</span> at <span class="paper-metric">77.8%</span> pruning, and from <span class="paper-metric">82.9%</span> to <span class="paper-metric">89.0%</span> at <span class="paper-metric">88.9%</span> pruning.
- On <span class="paper-key">Video-LLaVA-7B</span>, CLASP also improves the average score from <span class="paper-metric">51.22</span> for SparseVLM to <span class="paper-metric">52.95</span>, slightly exceeding the unpruned upper-bound average of <span class="paper-metric">52.23</span> in the reported table.

## Efficiency and Visualization

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 680px;">
    <img src="/assets/img/publication_preview/CLASP/Visual.png" alt="Token retention visualization">
    <p class="project-caption"><span class="paper-key">Token-Retention Maps.</span> The visualization compares SparseVLM and CLASP across progressive pruning layers. CLASP retains more task-relevant regions while using attention-selected tokens for relevance and similarity-selected tokens for contextual coverage.</p>
  </div>
</div>

The efficiency study on POPE further shows that CLASP reduces inference cost while preserving accuracy. With <span class="paper-key">192 retained tokens</span>, CLASP reaches <span class="paper-metric">99.6%</span> accuracy retention and a <span class="paper-metric">1.5x</span> time speedup. With <span class="paper-key">58 retained tokens</span>, it keeps <span class="paper-metric">95.4%</span> accuracy retention and reaches a <span class="paper-metric">2.1x</span> time speedup.

## Why These Results Matter

CLASP is useful because it frames efficiency as a <span class="paper-key">conditional modeling problem</span> rather than a hard-coded compression rule. That is a better fit for real multimodal systems, where the visual evidence needed for OCR, counting, grounding, spatial reasoning, and scene understanding can be very different.

The practical implication is that token pruning does not have to be a crude tradeoff between speed and quality. By conditioning both feature fusion and pruning on the instruction category, CLASP can remove most visual tokens while preserving the evidence needed for robust multimodal inference.
