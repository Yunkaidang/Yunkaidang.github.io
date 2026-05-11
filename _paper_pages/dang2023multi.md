---
paper_key: dang2023multi
bibtex_display_key: dang2023mlcn
hero_venue: ICME 2023
hero_authors_html: >-
  Yunkai Dang, Min Zhang, Zhengyu Chen, Xinliang Zhang, Zheng Wang,
  Meijun Sun, Donglin Wang
hero_highlights:
  - icon: project-diagram
    title: Multi-Level Correlation Modeling
    text: MLCN reasons over self-correlation, cross-correlation, and pattern-correlation instead of relying on a single global similarity score.
  - icon: search-plus
    title: Fine-Grained Local Correspondence
    text: The framework strengthens support-query matching with local structural cues that transfer better under scarce supervision.
  - icon: chart-line
    title: Strong Few-Shot Performance
    text: The model reports 65.54 and 81.63 on miniImageNet 1-shot and 5-shot, with further gains on CUB and CIFAR-FS.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2412.03159
    icon: paper
  - label: MLCN Code
    url: https://github.com/Yunkai696/MLCN
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


## Project Overview

Multi-Level Correlation Network (MLCN) targets few-shot image classification, where the model must generalize to novel classes from only a handful of labeled examples. The paper argues that many metric-learning approaches compare support and query images at only one representation level, which is often too weak for fine-grained transfer. When training data is scarce, the model needs a richer notion of correspondence than one global feature similarity.

MLCN addresses this by explicitly modeling local semantic correspondence and structural pattern similarity across multiple levels of representation. The emphasis is not just on stronger feature extraction, but on better transferability from base classes to novel classes.

## Method Pipeline

The model introduces three complementary components. The self-correlation module captures internal local structure. The cross-correlation module models correspondence between support and query images. The pattern-correlation module then focuses on recurring structural patterns that are useful in fine-grained recognition. Together, these modules produce a multi-level similarity signal that is more expressive than standard prototype matching.

<div class="project-grid">
  <div class="project-media">
    <img src="/assets/img/publication_preview/Multi-level.png" alt="Multi-level correlation network overview">
    <p class="project-caption">MLCN compares images through multi-level local correspondences instead of relying only on one global similarity score.</p>
  </div>
</div>

## Main Experimental Results

- On miniImageNet, the paper reports 65.54 ± 0.43 for 5-way 1-shot and 81.63 ± 0.31 for 5-way 5-shot with a ResNet12 backbone.
- On CUB-200-2011, the reported performance reaches 77.96 ± 0.44 for 1-shot and 91.20 ± 0.24 for 5-shot, showing particularly strong transfer on fine-grained categories.
- On CIFAR-FS, the reported results reach 74.36 ± 0.47 for 1-shot and 87.24 ± 0.31 for 5-shot.
- The ablation study is also strong: compared with the baseline using only the classification objective, adding the proposed modules improves accuracy by an average of 7.2% in 1-shot settings and 8.6% in 5-shot settings across the analyzed datasets.
- After introducing the local-correlation components, the paper reports further gains of about 1.4% for 1-shot and 1.3% for 5-shot, indicating that the fine-grained local matching design contributes on top of the base representation improvements.

## Why It Matters

MLCN is a useful reminder that few-shot learning is often limited by the quality of the similarity function rather than only the backbone. When supervision is scarce, local relational structure becomes a major source of transferable signal.

The broader lesson also remains relevant outside classic few-shot classification: multi-level correspondence is often more robust than single-scale matching whenever fine-grained recognition and data efficiency matter.
