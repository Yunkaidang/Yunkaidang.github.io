---
paper_key: dang2025exploring
bibtex_display_key: dang2025exploring
hero_venue: EMNLP 2025
hero_authors_html: >-
  Yunkai Dang, Mengxi Gao, Yibo Yan, Xin Zou, Yanggan Gu, Jungang Li,
  Jingyu Wang, Peijie Jiang, Aiwei Liu, Jia Liu, Xuming Hu
hero_highlights:
  - icon: exclamation-triangle
    title: Misleading-Scenario Evaluation
    text: MUB measures whether an MLLM abandons a previously correct answer after receiving explicit or implicit deceptive cues.
  - icon: database
    title: 2.5K Multimodal Uncertainty Benchmark
    text: The benchmark covers 1.7K multiple-choice and 0.8K true-or-false items with difficulty splits calibrated by strong MLLMs.
  - icon: shield-alt
    title: Robustness Gains From Compact Tuning
    text: A 2K-sample mixed-instruction fine-tuning recipe sharply reduces misleading rates while preserving base capability.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2411.02708
    icon: paper
  - label: MUB Code
    url: https://github.com/Yunkai696/MUB
    icon: github
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

This project studies a failure mode that many users notice in practice but few benchmarks isolate cleanly: an MLLM gives the correct answer first, then abandons it after receiving a misleading cue. The paper names this phenomenon <span class="paper-key">response uncertainty</span> and argues that standard accuracy metrics miss a large part of the problem because they do not measure how stable a correct answer remains under deceptive instructions.

To study this systematically, the paper introduces a two-stage misleading-instruction pipeline and builds the <span class="paper-key">Multimodal Uncertainty Benchmark (MUB)</span>. The benchmark is designed to quantify how easily models are pushed away from previously correct answers by explicit false hints or implicit contradictory context.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 860px;">
    <img src="/assets/img/publication_preview/uncertainy.png" alt="Exploring response uncertainty overview">
    <p class="project-caption">MUB measures how often a multimodal model reverses a previously correct answer after explicit or implicit misleading cues are introduced.</p>
  </div>
</div>

<p><i class="fas fa-exclamation-triangle paper-inline-icon"></i><span class="paper-key">Response Uncertainty:</span> the benchmark focuses on the specific case where a model already has the right answer but gives it up after being nudged by deceptive multimodal context.</p>

<p><i class="fas fa-random paper-inline-icon"></i><span class="paper-key">Two-Stage Misleading Pipeline:</span> the procedure first tests the original prompt, then injects misleading information and measures whether the answer flips from correct to incorrect or vice versa.</p>

<p><i class="fas fa-shield-alt paper-inline-icon"></i><span class="paper-key">Robustness Gains:</span> a compact mixed-instruction fine-tuning strategy reduces the explicit misleading rate to <span class="paper-metric">6.97%</span> and the implicit misleading rate to <span class="paper-metric">32.77%</span>.</p>

<div class="project-grid project-grid-2">
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-chart-line paper-inline-icon"></i><span class="paper-key">Benchmark Signal:</span> across nine datasets, open-source MLLMs overturn a previously correct answer in about <span class="paper-metric">65%</span> of cases after a single deceptive cue.</p>
  </div>
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-file-alt paper-inline-icon"></i><span class="paper-key">Paper Resource:</span> the full benchmark and analysis are available on <a href="https://arxiv.org/pdf/2411.02708"><i class="ai ai-arxiv paper-inline-icon" style="margin-left:0.3rem;margin-right:0.3rem;"></i>arXiv</a>.</p>
  </div>
</div>

This is not just a robustness stress test bolted onto existing VQA benchmarks. The paper is explicitly about whether a model can <span class="paper-key">hold onto a correct answer</span> once misleading instructions appear, which makes it a useful complement to standard accuracy tables.

## Method Pipeline

The procedure first queries a model on the original image-question pair. It then adds misleading information to create a second version of the prompt and measures whether the answer flips from correct to incorrect or vice versa. Using this framework, the authors curate a 2.5k-sample benchmark consisting of 1.7k multiple-choice questions and 0.8k true-or-false questions. MUB is further divided into low-, medium-, and high-difficulty groups according to how many strong MLLMs the example can mislead.

## Main Experimental Results

- Across nine standard datasets, the paper reports that state-of-the-art open-source MLLMs overturn a previously correct answer in about <span class="paper-metric">65%</span> of cases after receiving a single deceptive cue.
- In the large-scale benchmark sweep, the average misleading rate for true-to-false transitions is about <span class="paper-metric">65.39%</span>, while the false-to-true transition rate is about <span class="paper-metric">83.35%</span>, showing that model responses are highly unstable under misleading supervision.
- On MUB, the paper reports very high susceptibility overall: explicit misleading instructions exceed <span class="paper-metric">67.19%</span> misleading rate, implicit misleading instructions exceed <span class="paper-metric">80.67%</span>, and the selected uncertainty slices remain difficult across both open-source and closed-source model families.
- A compact <span class="paper-metric">2,000</span>-sample mixed-instruction fine-tuning strategy dramatically improves robustness: the misleading rates drop to <span class="paper-metric">6.97%</span> for explicit cues and <span class="paper-metric">32.77%</span> for implicit cues, while consistency on highly deceptive inputs improves by nearly <span class="paper-metric">29.37%</span>.
- The paper also reports slight accuracy gains on MUB and on additional benchmarks after robustness-oriented fine-tuning, which is important because it shows the defense is not simply trading away base capability.

## Why These Results Matter

A high-accuracy model can still be unreliable if it is easy to push off course. This project turns that intuition into a measurable benchmark and gives the community a way to study uncertainty, susceptibility, and recovery under misleading conditions.

That matters for trustworthy multimodal systems, especially in scenarios where the prompt source may be noisy, adversarial, or simply wrong. MUB and the accompanying analysis make it easier to compare models not only by what they know, but by how firmly they can hold onto a correct answer.
