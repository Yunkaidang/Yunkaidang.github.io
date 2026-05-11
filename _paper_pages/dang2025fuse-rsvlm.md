---
paper_key: dang2025fuse-rsvlm
bibtex_display_key: dang2025fusersvlm
hero_venue: arXiv 2025
hero_authors_html: >-
  Yunkai Dang<sup>*</sup>, Donghao Wang<sup>*</sup>, Jiacheng Yang,
  Yifan Jiang, Meiyi Zhu, Yuekun Yang, Cong Wang, Qi Fan,
  Wenbin Li<sup>&dagger;</sup>, Yang Gao
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
  - icon: vector-square
    title: Multi-Feature Fusion for RS Scenes
    text: The model combines global context with fine-grained local features so that small structures and complex scene layouts are preserved.
  - icon: sync-alt
    title: Recurrent Visual Feature Injection
    text: Visual evidence is injected back into the language model during generation to reduce visual forgetting in long reasoning chains.
  - icon: trophy
    title: Strong Results Across Three Tasks
    text: FUSE-RSVLM reports 65.76% VQA accuracy, 74.51% average classification accuracy, and state-of-the-art captioning results on multiple RS benchmarks.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2512.24022
    icon: paper
  - label: RSVLM Code
    url: https://github.com/Yunkaidang/RSVLM
    icon: github
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
  color: #2f8fcb;
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

Remote sensing imagery differs sharply from natural images: scenes are viewed from a nadir perspective, objects are small and dense, spatial layout is highly structured, and thin elements such as roads, bridges, ships, and vehicles can disappear after ordinary resizing. Existing remote sensing VLMs therefore face two coupled problems: they often fail to extract <span class="paper-key">fine-grained local visual features</span>, and they can suffer from <span class="paper-key">visual forgetting</span> as static visual tokens pass through deep language-centric decoding layers.

In this paper, <span class="paper-key">we propose FUSE-RSVLM, whose core model is MF-RSVLM, a Multi-Feature Fusion Remote Sensing Vision-Language Model</span>. The method learns multi-scale visual representations, combines global context with local details, and recurrently injects visual evidence into selected LLM layers. It is instruction-tuned with a <span class="paper-key">293K-sample remote-sensing instruction corpus</span> covering captioning, VQA, visual grounding, scene classification, instruction QA, and detection.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 620px;">
    <img src="/assets/img/publication_preview/MF-RSVLM/Compare.png" alt="MF-RSVLM comparison across remote sensing tasks">
    <p class="project-caption"><span class="paper-key">Task-Level Comparison.</span> MF-RSVLM shows strong results across scene classification, single-image VQA, and image captioning, indicating that multi-feature fusion improves both perception and generation in remote-sensing scenes.</p>
  </div>
</div>

<p><i class="fas fa-satellite paper-inline-icon"></i><span class="paper-key">Remote Sensing Mismatch:</span> Generic VLMs struggle with nadir-view imagery, tiny objects, dense layouts, and geospatial structures that are easily lost under fixed low-resolution encoding.</p>

<p><i class="fas fa-layer-group paper-inline-icon"></i><span class="paper-key">Multi-Scale Feature Extraction:</span> MF-RSVLM combines low-resolution global tokens with high-resolution sliding-window detail stacks to preserve both holistic scene context and local evidence.</p>

<p><i class="fas fa-sync-alt paper-inline-icon"></i><span class="paper-key">Recurrent Visual Injection:</span> A router and gated injection module repeatedly writes relevant detail features into selected LLM layers, reducing visual forgetting during generation.</p>

<p><i class="fas fa-trophy paper-inline-icon"></i><span class="paper-key">Strong Results:</span> Experiments report <span class="paper-metric">65.76%</span> VRSBench VQA accuracy, <span class="paper-metric">74.51%</span> average classification accuracy, and state-of-the-art captioning on UCM-Captions and Sydney-Captions.</p>

## Method Pipeline

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 900px;">
    <img src="/assets/img/publication_preview/MF-RSVLM/Method.png" alt="MF-RSVLM method overview">
    <p class="project-caption"><span class="paper-key">Method Overview.</span> MF-RSVLM takes a low-resolution <span class="paper-key">336x336</span> image for global context and a high-resolution <span class="paper-key">672x672</span> image for local detail extraction. Multi-sized sliding windows generate local patches, the shared vision encoder builds a high-resolution feature canvas, and detail stacks are fused and injected into selected LLM layers through a gate.</p>
  </div>
</div>

The model follows a CLIP ViT-L/14@336 vision encoder, MLP projector, and Vicuna-v1.5-7B LLM pipeline. For global context, the image is resized to the ordinary low-resolution view and encoded into global visual tokens. For local detail, the image is resized to a <span class="paper-key">672x672</span> canvas, split into overlapping windows such as <span class="paper-key">336x336</span> and <span class="paper-key">168x168</span>, and processed by the shared vision encoder. Features from ViT layers <span class="paper-key">8</span>, <span class="paper-key">16</span>, and <span class="paper-key">24</span> are scattered back onto a high-resolution feature canvas, then sampled into ordered detail stacks.

At LLM layers <span class="paper-key">2</span>, <span class="paper-key">4</span>, <span class="paper-key">6</span>, and <span class="paper-key">8</span>, a lightweight router selects relevant detail stacks conditioned on the current visual stream. A gate then controls how much of the fused detail is written back into the visual hidden states. This design keeps the representation visually grounded across decoding instead of relying on a one-time visual prefix.

## Main Experimental Results

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 820px;">
    <img src="/assets/img/publication_preview/MF-RSVLM/Experiment.png" alt="VRSBench VQA benchmark results">
    <p class="project-caption"><span class="paper-key">VRSBench VQA Results.</span> MF-RSVLM ranks first overall with <span class="paper-metric">65.76%</span> average accuracy across Category, Existence, Position, Quantity, Scene, Color, Image, Shape, and Direction tasks.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 860px;">
    <img src="/assets/img/publication_preview/MF-RSVLM/Experiment2.png" alt="Remote sensing image captioning results">
    <p class="project-caption"><span class="paper-key">Image Captioning Results.</span> Across five remote-sensing captioning benchmarks, MF-RSVLM reports new state-of-the-art results on UCM-Captions and Sydney-Captions and strong METEOR/ROUGE-L performance on the remaining datasets.</p>
  </div>
</div>

- On <span class="paper-key">VRSBench VQA</span>, MF-RSVLM ranks first overall with an average accuracy of <span class="paper-metric">65.76%</span>. The reported gains are <span class="paper-metric">+4.93</span> over the strongest open-source general VLM, <span class="paper-metric">+3.67</span> over the best closed-source system, <span class="paper-metric">+14.25</span> over VHM, and <span class="paper-metric">+21.06</span> over SkySenseGPT.
- On the same VQA benchmark, MF-RSVLM achieves leading scores on key perception tasks, including <span class="paper-metric">65.84</span> on Category and <span class="paper-metric">90.23</span> on Existence. The paper attributes this to better contextual retention from recurrent visual feature injection.
- Across seven remote-sensing classification datasets, MF-RSVLM reports the best macro-average Top-1 accuracy of <span class="paper-metric">74.51%</span>. This is <span class="paper-metric">+2.68</span> over the strongest remote-sensing baseline, LHRS-Bot, and <span class="paper-metric">+11.73</span> over InternVL3.5, the strongest open-source general VLM in the comparison.
- On classification, the method is especially strong on <span class="paper-key">AID</span>, <span class="paper-key">NWPU-RESISC45</span>, and <span class="paper-key">METER-ML</span>, reaching <span class="paper-metric">94.37</span>, <span class="paper-metric">94.29</span>, and <span class="paper-metric">74.87</span> Top-1 accuracy respectively. The paper highlights gains of <span class="paper-metric">+3.11</span> on AID and <span class="paper-metric">+4.63</span> on SIRI-WHU over LHRS-Bot.
- On remote-sensing image captioning, MF-RSVLM establishes new state-of-the-art results on <span class="paper-key">UCM-Captions</span> across all four metrics, with <span class="paper-metric">79.92</span> BLEU-4, <span class="paper-metric">89.47</span> METEOR, <span class="paper-metric">387.90</span> CIDEr, and <span class="paper-metric">88.51</span> ROUGE-L. The reported gains over the best prior results are <span class="paper-metric">+20.15</span>, <span class="paper-metric">+45.39</span>, <span class="paper-metric">+260.20</span>, and <span class="paper-metric">+56.42</span>.
- On <span class="paper-key">Sydney-Captions</span>, MF-RSVLM also reports new best results with <span class="paper-metric">56.21</span> BLEU-4, <span class="paper-metric">72.86</span> METEOR, <span class="paper-metric">242.48</span> CIDEr, and <span class="paper-metric">71.85</span> ROUGE-L, corresponding to gains of <span class="paper-metric">+12.20</span>, <span class="paper-metric">+17.95</span>, <span class="paper-metric">+121.58</span>, and <span class="paper-metric">+28.10</span>.
- On <span class="paper-key">RSVQA-LRBEN</span>, MF-RSVLM reaches <span class="paper-metric">89.69%</span> average accuracy, with <span class="paper-metric">90.21%</span> on Presence and <span class="paper-metric">89.16%</span> on Comparison. On <span class="paper-key">VRSBench-Cap</span>, it obtains <span class="paper-metric">38.64</span> BLEU-4, <span class="paper-metric">28.01</span> METEOR, <span class="paper-metric">38.64</span> CIDEr, and <span class="paper-metric">28.01</span> ROUGE-L.

## Ablation and Cases

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 680px;">
    <img src="/assets/img/publication_preview/MF-RSVLM/case.png" alt="MF-RSVLM qualitative case study">
    <p class="project-caption"><span class="paper-key">Qualitative Examples.</span> Case studies on category, existence, and counting questions show that MF-RSVLM better preserves remote-sensing evidence needed for fine-grained answers.</p>
  </div>
</div>

The ablation studies support the design choices in the method. Fusing ViT layers <span class="paper-key">8/16/24</span> with both <span class="paper-key">336x336</span> and <span class="paper-key">168x168</span> sliding windows outperforms reduced layer or single-window variants across classification and composition benchmarks. Similarly, injecting visual features into LLM layers <span class="paper-key">2/4/6/8</span> gives the best overall result, improving METER-ML from <span class="paper-metric">66.37%</span> with fewer injection layers to <span class="paper-metric">72.74%</span>, and improving HR-Comp from <span class="paper-metric">77.90%</span> to <span class="paper-metric">82.80%</span>.

## Why These Results Matter

FUSE-RSVLM is not only another remote-sensing fine-tune. Its main value is that it treats <span class="paper-key">visual grounding as a process</span> that must be maintained through the whole reasoning chain. That is a better design for captioning, VQA, and classification in high-resolution geospatial imagery, where the decisive visual evidence may be small, sparse, or easily overwhelmed by global scene context.

The experimental results also show that remote-sensing-specific modeling choices still matter even in the era of general VLMs. Multi-scale visual fusion and recurrent detail injection remain strong advantages when the visual signal is dense, fine-grained, and spatially structured.
