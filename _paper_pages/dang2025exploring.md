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
.paper-inline-icon {
  color: #6d5dd3;
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

Multimodal large language models can answer visual questions correctly, but that does not always mean the answer is stable. This project studies a concrete failure mode: an MLLM gives the correct response on the original image-question pair, then abandons that answer after a misleading cue is inserted into the prompt.

The paper calls this behavior <span class="paper-key">response uncertainty</span>. Instead of only measuring whether a model can solve a benchmark item once, the evaluation asks whether the model can <span class="paper-key">preserve an originally correct answer</span> when it is confronted with explicit false hints or implicit contextual contradictions.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 620px;">
    <img src="/assets/img/publication_preview/Uncertainty/Motivation.png" alt="Response uncertainty motivation">
    <p class="project-caption"><span class="paper-key">Motivation.</span> The consistency histograms show that misleading-prone examples expose unstable responses, and that targeted fine-tuning improves consistency most strongly on high-misleading-rate data.</p>
  </div>
</div>

<p><i class="fas fa-exclamation-triangle paper-inline-icon"></i><span class="paper-key">Response Uncertainty:</span> the benchmark focuses on correct-to-incorrect flips, where a model already has the right answer but gives it up after a misleading instruction.</p>

<p><i class="fas fa-database paper-inline-icon"></i><span class="paper-key">Multimodal Uncertainty Benchmark:</span> MUB is curated from uncertainty-prone samples and stratified into low-, medium-, and high-difficulty groups according to how many strong MLLMs are misled.</p>

<p><i class="fas fa-random paper-inline-icon"></i><span class="paper-key">Explicit and Implicit Misleading:</span> the evaluation covers direct false-answer hints as well as contextual contradictions that nudge the model toward a wrong answer less directly.</p>

<p><i class="fas fa-shield-alt paper-inline-icon"></i><span class="paper-key">Robustness Gains:</span> a compact <span class="paper-metric">2,000</span>-sample mixed-instruction fine-tuning strategy sharply reduces misleading rates while slightly improving standard benchmark accuracy.</p>

<div class="project-grid project-grid-2">
  <div class="project-media">
    <p><i class="fas fa-chart-line paper-inline-icon"></i><span class="paper-key">Benchmark Signal:</span> across nine datasets, twelve open-source MLLMs overturn a previously correct answer in about <span class="paper-metric">65%</span> of cases after a single deceptive cue.</p>
  </div>
  <div class="project-media">
    <p><i class="fas fa-file-alt paper-inline-icon"></i><span class="paper-key">Paper Resource:</span> the full benchmark and analysis are available on <a href="https://arxiv.org/pdf/2411.02708"><i class="ai ai-arxiv paper-inline-icon" style="margin-left:0.3rem;margin-right:0.3rem;"></i>arXiv</a>.</p>
  </div>
</div>

## Method Pipeline

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 980px;">
    <img src="/assets/img/publication_preview/Uncertainty/Method.png" alt="MUB method overview">
    <p class="project-caption"><span class="paper-key">Method Overview.</span> The pipeline first extracts misleading-prone examples from widely used multimodal benchmarks, builds the Multimodal Uncertainty Benchmark (MUB), evaluates open-source and closed-source MLLMs with explicit and implicit misleading instructions, and then fine-tunes open-source models with mixed-instruction data to reduce response uncertainty.</p>
  </div>
</div>

The evaluation starts by querying a model on the original image-question pair. After the initial response is obtained, the prompt is modified with a misleading instruction and the model is queried again. The key metric is the <span class="paper-key">misleading rate</span>, which measures how often an originally correct answer flips to an incorrect one.

Using this protocol, the authors collect uncertainty-prone examples from nine widely used multimodal benchmarks, including <span class="paper-key">MME</span>, <span class="paper-key">SEED</span>, <span class="paper-key">MMBench</span>, <span class="paper-key">MMStar</span>, <span class="paper-key">MMMU</span>, <span class="paper-key">ScienceQA</span>, <span class="paper-key">AI2D</span>, <span class="paper-key">MathVista</span>, and <span class="paper-key">ConBench</span>. MUB contains <span class="paper-metric">2.5K</span> samples, including <span class="paper-metric">1.7K</span> multiple-choice questions and <span class="paper-metric">0.8K</span> true-or-false questions, and is grouped into low-, medium-, and high-difficulty splits.

The paper then evaluates <span class="paper-metric">12</span> open-source and <span class="paper-metric">5</span> closed-source MLLMs under both explicit misleading instructions, such as a direct false-answer hint, and implicit misleading instructions, such as a contextual statement that contradicts the visual evidence.

## Main Experimental Results

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 980px;">
    <img src="/assets/img/publication_preview/Uncertainty/result1.png" alt="Misleading rate results across datasets and instruction types">
    <p class="project-caption"><span class="paper-key">Dataset and Instruction Trends.</span> The radar plots summarize misleading rates across nine datasets, while the scatter plots compare explicit and implicit misleading behavior across different MLLMs and prompt variants.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 980px;">
    <img src="/assets/img/publication_preview/Uncertainty/Experiment1.png" alt="MUB misleading rate comparison before fine-tuning">
    <p class="project-caption"><span class="paper-key">MUB Evaluation Before Fine-Tuning.</span> Closed-source and open-source MLLMs show high misleading rates, especially on high-difficulty examples and implicit misleading instructions.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 980px;">
    <img src="/assets/img/publication_preview/Uncertainty/Experiment2.png" alt="MUB misleading rate comparison after fine-tuning">
    <p class="project-caption"><span class="paper-key">MUB Evaluation After Fine-Tuning.</span> Fine-tuning with a compact mixed-instruction dataset substantially lowers correct-to-incorrect misleading rates across model families and difficulty levels.</p>
  </div>
</div>

- Across nine standard datasets, the paper reports that twelve state-of-the-art open-source MLLMs overturn a previously correct answer in about <span class="paper-metric">65%</span> of cases after receiving a single deceptive cue.
- On MUB, misleading rates increase with difficulty. Before fine-tuning, the average explicit misleading rate rises from <span class="paper-metric">45.85%</span> on low-difficulty samples to <span class="paper-metric">86.79%</span> on high-difficulty samples, while the average implicit misleading rate reaches <span class="paper-metric">87.68%</span> on high-difficulty samples.
- Across the benchmark analysis, explicit misleading instructions exceed <span class="paper-metric">67.19%</span> misleading rate, while implicit misleading instructions exceed <span class="paper-metric">80.67%</span>, showing that subtle contradictions can be even more disruptive than direct false hints.
- After robustness-oriented fine-tuning, the average explicit misleading rate drops to <span class="paper-metric">6.97%</span> and the average implicit misleading rate drops to <span class="paper-metric">32.77%</span>. On the tabled MUB splits, the post-tuning averages are <span class="paper-metric">4.8%</span>, <span class="paper-metric">8.7%</span>, and <span class="paper-metric">7.4%</span> for explicit low-, medium-, and high-difficulty samples.
- The same fine-tuning recipe boosts consistency by nearly <span class="paper-metric">29.37%</span> on highly deceptive inputs and slightly improves standard benchmark accuracy, indicating that the mitigation does not simply trade away base capability.

## Qualitative Examples

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 900px;">
    <img src="/assets/img/publication_preview/Uncertainty/Example1.png" alt="Explicit misleading examples from MUB">
    <p class="project-caption"><span class="paper-key">Explicit Misleading Samples.</span> These examples show how a direct false hint can conflict with the visual evidence and pressure a model to abandon a correct answer.</p>
  </div>
</div>

The qualitative cases illustrate why this benchmark is different from ordinary accuracy evaluation. The question itself is still answerable from the image, but the instruction stream includes an adversarial cue. A reliable MLLM should be able to compare that cue against the visual evidence instead of treating the prompt as ground truth.

## Why These Results Matter

A high-accuracy model can still be unreliable if it is easy to push off course. This project turns that concern into a measurable benchmark and gives the community a way to study uncertainty, susceptibility, and recovery under misleading conditions.

That matters for trustworthy multimodal systems, especially in settings where the prompt source may be noisy, adversarial, or simply wrong. MUB and the accompanying analysis make it easier to compare models not only by what they know, but by how firmly they can hold onto a correct answer when misleading information appears.
