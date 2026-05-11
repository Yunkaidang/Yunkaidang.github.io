---
paper_key: dang2026instinct
bibtex_display_key: dang2026instinct
hero_venue: arXiv 2026
hero_authors_html: >-
  Yunkai Dang, Yifan Jiang, Yizhu Jiang, Anqi Chen, Wenbin Li, Yang Gao
hero_affiliations:
  - name: Reasoning and Learning Research Group
    logo: /assets/img/icons/rlmind.png
    show_name: false
  - name: Nanjing University
    url: https://www.nju.edu.cn/en/
    logo: /assets/img/icons/nju.png
    show_name: false
hero_highlights:
  - icon: project-diagram
    title: Dual-Channel Confidence Evaluation
    text: The paper jointly models instinctive token probabilities and reflective verbal self-assessment instead of relying on a single confidence source.
  - icon: robot
    title: MLLM-Centric Reliability Modeling
    text: Confidence signals are extracted from open-source and proprietary MLLMs across diverse multimodal reasoning benchmarks and prompt strategies.
  - icon: chart-line
    title: Monotone Confidence Calibration
    text: A monotone fusion head and order-preserving mean alignment produce better calibrated reliability estimates.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2604.17274
    icon: paper
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
.paper-inline-icon {
  color: #76b900;
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

Multimodal Large Models can expose confidence through two different channels. The first is <span class="paper-key">instinct</span>: the probability distribution over answer tokens. The second is <span class="paper-key">reflection</span>: the model's explicit verbalized estimate of how confident it is. These two signals are often treated separately, even though both are available during multimodal inference and both can fail in different ways.

In this paper, <span class="paper-key">we study how to unify token confidence and verbalized confidence for better MLLM reliability estimation</span>. Instead of relying on self-consistency aggregation, prompt-only strategies, or a single confidence source, the method extracts both channels and combines them with <span class="paper-key">monotone confidence fusion</span> so that the final score is better aligned with actual correctness.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 640px;">
    <img src="/assets/img/publication_preview/Confidence/Motivation.png" alt="Motivation for dual-channel confidence evaluation">
    <p class="project-caption"><span class="paper-key">Motivation.</span> Prior confidence estimation strategies are sensitive to sampling, aggregation, and prompting choices. The proposed framework uses both token-level probabilities and verbalized self-assessment signals, then calibrates them through monotone fusion.</p>
  </div>
</div>

<p><i class="fas fa-project-diagram paper-inline-icon"></i><span class="paper-key">Dual-Channel Confidence Evaluation:</span> the framework evaluates both token-level probability confidence and verbalized self-assessment confidence for answer options.</p>

<p><i class="fas fa-robot paper-inline-icon"></i><span class="paper-key">MLLM-Centric Reliability Modeling:</span> the analysis focuses on real MLLM behavior across benchmarks, prompt strategies, and model families rather than treating confidence as a generic text-only calibration problem.</p>

<p><i class="fas fa-chart-line paper-inline-icon"></i><span class="paper-key">Monotone Confidence Calibration:</span> the fusion module combines complementary confidence cues while preserving reliability ordering and correcting distribution shifts.</p>

## Method Pipeline

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 960px;">
    <img src="/assets/img/publication_preview/Confidence/Method.png" alt="Overview of the dual-channel confidence calibration method">
    <p class="project-caption"><span class="paper-key">Method Overview.</span> The framework evaluates MLLMs across diverse benchmarks and prompt strategies, extracts token and verbal confidence for answer options, and feeds reliability features into a monotone fusion head followed by order-preserving mean alignment.</p>
  </div>
</div>

The method evaluates open-source and proprietary MLLMs on multimodal reasoning benchmarks such as <span class="paper-key">MMBench</span>, <span class="paper-key">MMStar</span>, <span class="paper-key">MMMU-Pro</span>, <span class="paper-key">AI2D</span>, <span class="paper-key">ConBench</span>, and <span class="paper-key">ScienceQA</span>. For each question, it extracts confidence signals from both the output token distribution and the model's verbal confidence response under different prompt strategies, including vanilla prompting, top-k prompting, self-probing, roleplay, and chain-of-thought variants.

The final calibrated score is produced from reliability features including token confidence, verbal confidence, consistency-related cues, answer margins, and distribution entropy. A monotone fusion head preserves the intuition that stronger reliability evidence should not decrease the final confidence, while order-preserving mean alignment corrects distribution shifts across models and datasets.

## Main Experimental Results

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 980px;">
    <img src="/assets/img/publication_preview/Confidence/Experiment1.png" alt="Calibration metrics for token and verbal confidence">
    <p class="project-caption"><span class="paper-key">Token vs. Verbal Confidence.</span> The experiments compare calibration and confidence-quality metrics, including ECE, AUROC, AUPRC, and AUPRC-N, across open-source and closed-source MLLMs.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 980px;">
    <img src="/assets/img/publication_preview/Confidence/Experiment2.png" alt="Performance under calibrated confidence fusion">
    <p class="project-caption"><span class="paper-key">Calibrated Confidence.</span> The final calibrated score is compared against the stronger single-channel baseline for each setting, showing how dual-channel fusion improves reliability estimation.</p>
  </div>
</div>

- The study shows that <span class="paper-key">token confidence</span> and <span class="paper-key">verbalized confidence</span> capture complementary reliability information rather than interchangeable signals.
- The calibrated confidence score improves the reliability estimate over either channel alone across multiple model families and benchmark types.
- The reported metrics emphasize both calibration quality and ranking quality: lower <span class="paper-metric">ECE</span> indicates better calibration, while higher <span class="paper-metric">AUROC</span>, <span class="paper-metric">AUPRC</span>, and <span class="paper-metric">AUPRC-N</span> indicate stronger confidence-based separation of correct and incorrect answers.
- On <span class="paper-key">MMBench</span>, calibrated confidence reduces ECE for MiniCPM-V-2.6 to <span class="paper-metric">3.58</span>, compared with <span class="paper-metric">5.14</span> from token confidence and <span class="paper-metric">7.45</span> from verbal confidence.
- On <span class="paper-key">MMStar</span>, calibrated confidence reduces ECE for MiniCPM-V-2.6 to <span class="paper-metric">6.82</span>, compared with <span class="paper-metric">17.11</span> from token confidence and <span class="paper-metric">26.87</span> from verbal confidence.
- For <span class="paper-key">GPT-4o</span>, calibrated confidence reaches <span class="paper-metric">1.92</span> ECE on MMBench and <span class="paper-metric">7.56</span> ECE on ConBench, improving over both single-channel confidence baselines in the reported tables.

## Qualitative Examples

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 920px;">
    <img src="/assets/img/publication_preview/Confidence/example1.png" alt="Example of verbal-internal disconnect">
    <p class="project-caption"><span class="paper-key">Verbal-Internal Disconnect.</span> The token distribution can favor the correct answer even when verbalized confidence assigns high confidence to an incorrect option.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 920px;">
    <img src="/assets/img/publication_preview/Confidence/example2.png" alt="Example of under-confident correct prediction">
    <p class="project-caption"><span class="paper-key">Under-Confident Correct Prediction.</span> The model may answer correctly with strong token confidence while its verbalized confidence remains hesitant, illustrating why a single confidence channel is insufficient.</p>
  </div>
</div>

## Why These Results Matter

Confidence is useful only when it predicts whether a model is actually right. This project makes that problem concrete for multimodal systems by separating what the model's token distribution says from what the model verbally claims about its own certainty.

The practical value is that downstream systems can use calibrated confidence as a more reliable trigger for abstention, human review, selective prediction, or model routing. By unifying instinct and reflection, the method gives a more robust view of MLLM reliability than either signal alone.
