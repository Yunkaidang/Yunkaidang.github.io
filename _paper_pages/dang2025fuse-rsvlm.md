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
</style>

## Project Overview

<span class="paper-key">FUSE-RSVLM</span> is motivated by a recurring mismatch between generic vision-language models and remote sensing imagery. Earth observation scenes differ from natural images in scale, spatial layout, object density, and the importance of <span class="paper-key">very small structures</span>. As a result, models that work well on natural-image VQA or captioning often fail to preserve fine-grained evidence or gradually lose visual grounding during long language decoding.

The paper addresses this by building a remote-sensing-oriented VLM that performs stronger <span class="paper-key">multi-scale feature extraction</span> and repeatedly <span class="paper-key">re-injects visual evidence</span> into the language model. The goal is not only better static image encoding, but also less visual forgetting during generation.

## Method Pipeline

The model learns and fuses complementary visual representations at multiple scales, combining <span class="paper-key">global scene context</span> with <span class="paper-key">localized detail features</span>. This is especially important in remote sensing, where a large scene overview is necessary but tiny local structures often determine the answer. On top of that, FUSE-RSVLM uses <span class="paper-key">recurrent visual feature injection</span> so that visual evidence is not consumed only once at the beginning of decoding, but can keep influencing later reasoning steps.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 880px;">
    <img src="/assets/img/publication_preview/RSVLM.png" alt="FUSE-RSVLM overview">
    <p class="project-caption">FUSE-RSVLM fuses multi-scale remote sensing features and repeatedly injects them into the language model to reduce visual forgetting.</p>
  </div>
</div>

<p><i class="fas fa-satellite paper-inline-icon"></i><span class="paper-key">Remote Sensing Mismatch:</span> generic vision-language models often miss fine-grained geospatial evidence and gradually lose visual grounding during long decoding chains.</p>

<p><i class="fas fa-layer-group paper-inline-icon"></i><span class="paper-key">Multi-Feature Fusion:</span> FUSE-RSVLM combines global scene context with localized detail features so that small but important structures remain visible to the model.</p>

<p><i class="fas fa-sync-alt paper-inline-icon"></i><span class="paper-key">Recurrent Visual Injection:</span> visual evidence is repeatedly fed back into the language model to reduce visual forgetting during captioning, VQA, and classification.</p>

<div class="project-grid project-grid-2">
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-trophy paper-inline-icon"></i><span class="paper-key">Strong Results:</span> the model reports <span class="paper-metric">65.76%</span> VQA accuracy and <span class="paper-metric">74.51%</span> average Top-1 accuracy across remote-sensing classification benchmarks.</p>
  </div>
  <div class="project-media" style="--project-image-max-width: 420px;">
    <p><i class="fas fa-file-alt paper-inline-icon"></i><span class="paper-key">Paper Resource:</span> the full method and experiments are available on <a href="https://arxiv.org/pdf/2512.24022"><i class="ai ai-arxiv paper-inline-icon" style="margin-left:0.3rem;margin-right:0.3rem;"></i>arXiv</a>.</p>
  </div>
</div>

## Main Experimental Results

- On the <span class="paper-key">VRSBench VQA</span> benchmark, FUSE-RSVLM ranks first overall with an average accuracy of <span class="paper-metric">65.76%</span>. The paper reports improvements of <span class="paper-metric">+4.93</span> over the strongest open-source general VLM, <span class="paper-metric">+3.67</span> over the best closed-source system in the comparison, <span class="paper-metric">+14.25</span> over VHM, and <span class="paper-metric">+21.06</span> over SkySenseGPT.
- On the same VQA evaluation, the model achieves top results on key perception-oriented tasks, including <span class="paper-metric">65.84</span> on Category and <span class="paper-metric">90.23</span> on Existence. The authors attribute this to better contextual retention from the visual feature injection mechanism.
- Across seven remote-sensing classification datasets, the model ranks first overall with an average Top-1 accuracy of <span class="paper-metric">74.51%</span>. This is <span class="paper-metric">+2.68</span> over the strongest remote-sensing baseline and <span class="paper-metric">+11.73</span> over the strongest open-source general VLM. The paper highlights gains such as <span class="paper-metric">+3.11</span> on AID and <span class="paper-metric">+4.63</span> on SIRI-WHU.
- On remote-sensing image captioning, the model achieves <span class="paper-key">new state-of-the-art results</span> on UCM-Captions across all four metrics, with reported gains of <span class="paper-metric">+20.15</span> BLEU-4, <span class="paper-metric">+45.39</span> METEOR, <span class="paper-metric">+260.20</span> CIDEr, and <span class="paper-metric">+56.42</span> ROUGE-L over the best prior result. The paper also reports new best results on Sydney-Captions, with gains of <span class="paper-metric">+12.20</span>, <span class="paper-metric">+17.95</span>, <span class="paper-metric">+121.58</span>, and <span class="paper-metric">+28.10</span> on the same four metrics.
- On the VRSBench-Cap split, the model reaches <span class="paper-metric">38.64</span> BLEU-4, <span class="paper-metric">28.01</span> METEOR, <span class="paper-metric">38.64</span> CIDEr, and <span class="paper-metric">28.01</span> ROUGE-L. The reported gains include <span class="paper-metric">+18.35</span> BLEU-4, <span class="paper-metric">+3.00</span> METEOR, and <span class="paper-metric">+7.72</span> ROUGE-L over prior methods, indicating that the model generates more semantically grounded captions rather than only maximizing n-gram overlap.

## Why These Results Matter

FUSE-RSVLM is not only another remote-sensing fine-tune. Its main value is that it explicitly treats <span class="paper-key">visual grounding as a process</span> that must be maintained through the whole reasoning chain. That is a better design for captioning, VQA, and classification in high-resolution geospatial imagery.

The experimental results also show that remote-sensing-specific modeling choices still matter even in the era of general VLMs. Multi-scale visual fusion and recurrent grounding remain strong advantages when the visual signal is dense, fine-grained, and spatially structured.
