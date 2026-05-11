---
paper_key: yu2024rlaif
bibtex_display_key: yu2024rlaifv
hero_venue: arXiv 2024
hero_authors_html: >-
  Tianyu Yu, Haoye Zhang, Yuan Yao, Yunkai Dang, Da Chen, Xiaoman Lu,
  Ganqu Cui, Taiwen He, Zhiyuan Liu, Tat-Seng Chua, Maosong Sun
hero_highlights:
  - icon: robot
    title: Open-Source AI Feedback Alignment
    text: RLAIF-V builds a fully open feedback pipeline so multimodal alignment no longer depends on proprietary annotators.
  - icon: shield-alt
    title: Hallucination Reduction At Training And Inference
    text: The framework combines preference optimization with self-feedback guidance to improve trustworthiness during both learning and decoding.
  - icon: chart-line
    title: Strong Trustworthiness Gains
    text: The paper reports large reductions in object hallucination while maintaining or improving helpfulness on general multimodal benchmarks.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2405.17220
    icon: paper
  - label: RLAIF-V Code
    url: https://github.com/RLHF-V/RLAIF-V
    icon: github
  - label: 7B Weights
    url: https://huggingface.co/openbmb/RLAIF-V-7B
    icon: huggingface
  - label: 12B Weights
    url: https://huggingface.co/openbmb/RLAIF-V-12B
    icon: huggingface
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


## Project Overview

RLAIF-V asks whether multimodal alignment can be done effectively without relying on proprietary supervision or large-scale human preference annotation. The paper proposes a fully open-source feedback learning framework for improving the trustworthiness of MLLMs, with a particular focus on reducing hallucination and making the alignment pipeline more reproducible.

The project combines preference learning with inference-time self-feedback guidance. That makes it more than a standard fine-tuning recipe: it is both a data-construction pipeline and a model-improvement framework for training-time and decoding-time trustworthiness.

## Framework Design

RLAIF-V builds high-quality feedback pairs using open-source MLLMs, a deconfounded data construction strategy, and a divide-and-conquer evaluation process that scores atomic claims more precisely. During inference, the aligned model can further improve itself with self-feedback guidance, which acts as an inference-time scaling mechanism for trustworthiness. The project also uses a reference-based review setting with a reported 96% human agreement on the dev split, which helps support the reliability of the automatic evaluation process.

<div class="project-grid">
  <div class="project-media">
    <img src="/assets/img/publication_preview/RLAIF-V.png" alt="RLAIF-V overview">
    <p class="project-caption">RLAIF-V aligns MLLMs with open-source AI feedback and extends that feedback signal into inference-time self-improvement.</p>
  </div>
</div>

## Main Experimental Results

- The paper reports that RLAIF-V 7B reduces object hallucination on Object HalBench by 80.7%, even surpassing the stronger labeler model used to construct the feedback.
- In a harder self-alignment setting, RLAIF-V 12B reduces object hallucination by 76.8% and achieves an overall hallucination rate of 35.6% on MHumanEval, outperforming GPT-4V by a substantial margin according to the paper.
- The hallucination reduction is not isolated to one benchmark: the authors report consistent gains on Object HalBench, MHumanEval, MMHal-Bench, AMBER, and RefoMB.
- The paper also emphasizes that these trustworthiness gains do not come at the cost of general usefulness. Helpfulness on MMStar improves over the base models, suggesting the framework can reduce hallucination without degrading general capability.
- Inference-time self-feedback also helps: the reported best-of-N experiments show that the RLAIF-V reward consistently improves trustworthiness for both the 7B and 12B variants during generation.

## Why It Matters

RLAIF-V matters because it demonstrates that open-source feedback can be a serious alignment signal for multimodal systems. That lowers the barrier for research teams who want to work on trustworthy MLLMs without depending on inaccessible proprietary annotation loops.

It also suggests a broader lesson: trustworthiness should not be treated as a purely training-time property. Feedback can be used to shape both the data and the decoding process, which makes alignment more flexible and potentially more effective in practice.
