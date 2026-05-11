---
paper_key: dang2026uhr-bat
bibtex_display_key: dang2026uhr
hero_venue: ICML 2026
hero_authors_html: >-
  Yunkai Dang<sup>*</sup>, Minxin Dai<sup>*</sup>, Yuekun Yang, Zhangnan Li,
  Wenbin Li<sup>&dagger;</sup>, Feng Miao, Yang Gao
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
  - icon: crosshairs
    title: Query-Guided Token Compression
    text: UHR-BAT allocates the visual token budget according to the current instruction so that small but decisive evidence is preserved.
  - icon: layer-group
    title: Region-Faithful Preserve and Merge
    text: The framework keeps informative regional tokens and merges redundant ones, reducing cost without destroying spatial structure.
  - icon: chart-line
    title: Strong UHR Remote Sensing Results
    text: The model reports 44.0 weighted average on XLRS-Bench and strong gains on MMERealworld-RS and RSHR-Bench.
project_links:
  - label: Paper
    url: https://arxiv.org/pdf/2604.13565
    icon: paper
  - label: UHR Code
    url: https://github.com/Yunkaidang/UHR
    icon: github
  - label: RL-MIND
    url: https://github.com/RL-MIND
    icon: github
  - label: RL-MIND
    url: https://huggingface.co/RL-MIND
    icon: huggingface
  - label: Demo (Coming Soon)
    icon: huggingface
    disabled: true
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


Ultra-high-resolution (UHR) remote sensing imagery couples kilometer-scale context with query-critical evidence that may occupy only a few pixels. Such vast spatial scale leads to a quadratic explosion of visual tokens and hinders the extraction of information from small objects. Previous works utilize direct downsampling, dense tiling, or global top-k pruning, which either compromise query-critical image details or incur unpredictable compute. In this paper, <span class="paper-key">we propose UHR-BAT, a query-guided and region-faithful token compression framework to efficiently select visual tokens under a strict context budget.e</span> Specifically, we leverage text-guided, multi-scale importance estimation for visual tokens, effectively tackling the challenge of achieving precise yet low-cost feature extraction. Furthermore, by introducing region-wise preserve and merge strategies, we mitigate visual token redundancy, further driving down the computational budget. Experimental results show that UHR-BAT achieves state-of-the-art performance across various benchmarks. Code will be available at this https URL.

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 480px;">
    <img src="/assets/img/publication_preview/UHR_BAT.png" alt="UHR-BAT overview">
    <p class="project-caption">UHR-BAT keeps query-relevant evidence while aggressively compressing redundant visual tokens in ultra-high-resolution scenes.</p>
  </div>
</div>

<p><i class="fas fa-satellite paper-inline-icon"></i><span class="paper-key">UHR-BAT Framework:</span> We propose <span class="paper-key">UHR-BAT</span>, a token compression framework designed for ultra-high-resolution remote-sensing MLLMs under strict context budgets.</p>

<p><i class="fas fa-crosshairs paper-inline-icon"></i><span class="paper-key">Query-Guided Multi-Scale Input:</span> We propose a <span class="paper-key">query-guided, multi-scale input mechanism</span> to integrate text-derived global priors and capture both holistic context and fine-grained details.</p>

<p><i class="fas fa-layer-group paper-inline-icon"></i><span class="paper-key">Region-Wise Preserve and Merge:</span> We propose <span class="paper-key">region-wise preserve and merge strategies</span> to preserve salient local evidence and aggregate redundant background into compact representatives.</p>

<p><i class="fas fa-chart-line paper-inline-icon"></i><span class="paper-key">Empirical Results:</span> Experiments across standard benchmarks confirm that <span class="paper-key">UHR-BAT establishes a new state of the art for efficient UHR understanding</span>, outperforming existing methods under strict token budgets.</p>


## Method Pipeline

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 880px;">
    <img src="/assets/img/publication_preview/UHRBAT/Method.png" alt="UHR-BAT overview">
    <p class="project-caption"><span class="paper-key">Method Overview.</span> We encode a high-resolution remote sensing image at <span class="paper-key">multiple scales</span> using a frozen ViT, apply <span class="paper-key">scale-specific positional embeddings</span> to distinguish visual tokens across scales, and obtain an <span class="paper-key">anchor-scale query-to-vision attention map</span> from the MLLM interface. A region partition, induced by <span class="paper-key">SAM</span> or <span class="paper-key">feature-plus-coordinate clustering</span>, enables <span class="paper-key">region-wise preserve-and-merge</span>, while remaining tokens are merged via average pooling to retain coarse context. A final <span class="paper-key">top-k step</span> enforces the per-scale token budget before the processed sequence is fed into the LLM for answer generation.</p>
  </div>
</div>

<span class="paper-key">UHR-BAT</span> encodes ultra-high-resolution remote-sensing images at multiple scales, uses <span class="paper-key">query-to-vision attention</span> to identify the anchor-scale evidence relevant to the current instruction, and then performs <span class="paper-key">region-wise preserve-and-merge</span> so that salient local structures are retained while redundant background tokens are compressed into compact representatives. The final top-k selection step guarantees that each scale respects the preset token budget.


## Main Experimental Results

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 680px;">
    <img src="/assets/img/publication_preview/UHRBAT/XLRSBench.png" alt="XLRS-Bench results">
    <p class="project-caption"><span class="paper-key">XLRS-Bench Results.</span> This table summarizes <span class="paper-key">perception</span> and <span class="paper-key">reasoning</span> sub-task performance under strict token budgets and shows that UHR-BAT achieves a new state of the art with <span class="paper-metric">44.0</span> weighted average accuracy.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 680px;">
    <img src="/assets/img/publication_preview/UHRBAT/RSHRBench.png" alt="RSHR-Bench results">
    <p class="project-caption"><span class="paper-key">RSHR-Bench Results.</span> The reported <span class="paper-key">Perception</span> and <span class="paper-key">Reasoning</span> scores show that UHR-BAT remains strong across diverse remote-sensing question types while operating under a constrained visual token budget.</p>
  </div>
</div>

- On <span class="paper-key">XLRS-Bench</span>, the paper reports a state-of-the-art weighted average score of <span class="paper-metric">44.0</span> across perception and reasoning tasks. This corresponds to gains of <span class="paper-metric">+22.8</span> over GeoChat, <span class="paper-metric">+20.4</span> over VHM, <span class="paper-metric">+21.0</span> over GPT-4o, <span class="paper-metric">+8.9</span> over Claude 3.7 Sonnet, and <span class="paper-metric">+2.9</span> over LLaVA-OneVision-72B.
- On <span class="paper-key">MMERealworld-RS</span>, UHR-BAT achieves the best mean score of <span class="paper-metric">33.33</span>. Relative to strong remote-sensing baselines, the reported gains are <span class="paper-metric">+12.01</span> over GeoChat, <span class="paper-metric">+9.15</span> over VHM, and <span class="paper-metric">+4.92</span> over GeoLLaVA-8K. It also exceeds the GPT-4o baseline by <span class="paper-metric">+5.91</span>, with especially large improvements on <span class="paper-key">Position</span> and <span class="paper-key">Color</span>.
- On <span class="paper-key">RSHR-Bench</span>, the method reaches <span class="paper-metric">29.2</span> on Perception and <span class="paper-metric">45.0</span> on Reasoning, giving the best overall averages among the open-source and remote-sensing baselines reported in the paper. The perception score is also higher than VILA-HD by <span class="paper-metric">+1.2</span>.
- The efficiency ablation is also informative: on XLRS-Bench, moving from a <span class="paper-key">2K</span> to <span class="paper-key">4K</span> context gives a clear gain for Qwen2.5-VL-7B, from <span class="paper-metric">38.08</span> to <span class="paper-metric">40.58</span>, while pushing to <span class="paper-key">8K</span> brings almost no further benefit. The paper uses this to argue that <span class="paper-key">compressed 4K-context processing</span> is the practical operating point.


## Qualitative Examples

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 680px;">
    <img src="/assets/img/publication_preview/UHRBAT/Visual.png" alt="Region-aware attention visualization">
    <p class="project-caption"><span class="paper-key">Attention Maps.</span> We display original images and enlarged views alongside their corresponding attention maps. The heatmaps show that the model focuses on <span class="paper-key">semantically relevant regions</span>, such as specific vehicles or infrastructure aligned with the textual query, while assigning lower importance to the background.</p>
  </div>
</div>
<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 680px;">
    <img src="/assets/img/publication_preview/UHRBAT/example2.png" alt="Qualitative response example">
    <p class="project-caption"><span class="paper-key">Response Example A.</span> This sample illustrates the versatility of our method in handling <span class="paper-key">spatial reasoning</span> and <span class="paper-key">fine-grained attribute recognition</span> on small objects in ultra-high-resolution scenes.</p>
  </div>
</div>

<div class="project-grid project-grid-1">
  <div class="project-media" style="--project-image-max-width: 680px;">
    <img src="/assets/img/publication_preview/UHRBAT/example3.png" alt="Qualitative response example">
    <p class="project-caption"><span class="paper-key">Response Example B.</span> This sample further shows that UHR-BAT can answer <span class="paper-key">query-specific reasoning</span> questions while preserving the small visual evidence required for precise recognition.</p>
  </div>
</div>


## Why These Results Matter

The main takeaway is that token compression for remote sensing cannot be treated as a purely generic speed trick. The model has to remain sensitive to <span class="paper-key">tiny, sparse, and spatially significant evidence</span>. <span class="paper-key">UHR-BAT</span> shows that <span class="paper-key">budget-aware compression</span> can still improve accuracy when the compression rule is aligned with query semantics and region structure.

For practical Earth observation systems, this matters because the deployment bottleneck is usually not just model quality, but quality under strict memory and latency limits. UHR-BAT is therefore useful not only as a better benchmark result, but also as a stronger recipe for building scalable remote sensing MLLMs.
