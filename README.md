<div align="center">
  <img src="assets/banner.svg" width="100%" alt="Awesome Video Understanding banner">
  <br><br>
  <a href="https://awesome.re"><img src="https://awesome.re/badge-flat2.svg" alt="Awesome"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-CC0--1.0-49a68b.svg" alt="CC0 license"></a>
  <a href="CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-welcome-66a6ff.svg" alt="PRs welcome"></a>
  <img src="https://img.shields.io/badge/updated-2026--08-102a43.svg" alt="Updated August 2026">
  <br><br>
  <strong>A curated roadmap of models, methods, datasets, and benchmarks for video understanding with multimodal large language models.</strong>
  <br><br>
  <a href="#-start-here">Start here</a> ·
  <a href="#-video-llms">Models</a> ·
  <a href="#-training-resources">Training</a> ·
  <a href="#-evaluation">Evaluation</a> ·
  <a href="README_zh-CN.md">简体中文</a>
</div>

> This repository accompanies the survey **Video Understanding in the Era of Multimodal Large Language Models** by Yiming Zhong, Chang Nie, Yan Yang, Xiaoyu Liu, and Caifeng Shan. It favors representative, reproducible work over an exhaustive paper dump.

## ✨ Highlights

- **Architecture-first taxonomy** — navigate by frame encoding, multimodal alignment, and language backbone.
- **Task-aware resources** — datasets and benchmarks are separated by the capability they measure.
- **Curated, not collected** — every entry has a one-line reason for inclusion.
- **Community-maintained** — consistent entries, automated link checks, and a lightweight PR template.

## 🧭 Start here

| If you want to… | Recommended path | Good first reads |
|---|---|---|
| Understand the field | Milestones → architecture → evaluation | Video-LLaMA, VideoChat, LLaVA-Video |
| Process long videos | Long-context encoding | MovieChat, LLaMA-VID, LongVU, LongVILA |
| Build a live assistant | Streaming encoding | StreamingVLM, Flash-VStream, StreamChat |
| Train a model | Pre-training → instruction tuning → alignment | InternVideo, ShareGPT4Video, VideoChat-R1 |
| Evaluate a model | General → long-video → temporal → streaming | Video-MME, MLVU, TempCompass, StreamingBench |

<details>
<summary><strong>Legend and inclusion policy</strong></summary>

- 📄 paper · 💻 code · 🤗 model/data · 🌐 project page
- Entries must be directly relevant to video understanding with foundation models or Video-LLMs.
- Preference is given to released papers with code, data, checkpoints, or lasting conceptual value.
- Ordering within a section is approximately chronological; this is not a leaderboard.

</details>

## 📚 Contents

- [Survey](#-survey)
- [Milestones](#-milestones)
- [Video-LLMs](#-video-llms)
  - [Basic encoding](#basic-encoding)
  - [Long-context encoding](#long-context-encoding)
  - [Streaming encoding](#streaming-encoding)
  - [Multimodal alignment](#multimodal-alignment)
- [Training resources](#-training-resources)
- [Evaluation](#-evaluation)
- [Challenges and frontiers](#-challenges-and-frontiers)
- [Contributing](#-contributing)

## 📝 Survey

### Video Understanding in the Era of Multimodal Large Language Models

**Yiming Zhong · Chang Nie · Yan Yang · Xiaoyu Liu · Caifeng Shan**

The survey organizes modern Video-LLMs through three architectural decisions—**frame encoding**, **multimodal alignment**, and **LLM selection**—then connects them to training strategies, datasets, evaluation protocols, and open challenges.

> 📌 The paper link and BibTeX will be added here when the publisher activates the public article page and DOI.

## 🕰️ Milestones

| Year | Work | Why it matters | Resources |
|:---:|---|---|:---:|
| 2022 | **InternVideo** | Establishes a general video foundation model through generative and discriminative learning. | [📄](https://arxiv.org/abs/2212.03191) [💻](https://github.com/OpenGVLab/InternVideo) |
| 2023 | **VideoChat** | Introduces a chat-centric framework for video understanding. | [📄](https://arxiv.org/abs/2305.06355) [💻](https://github.com/OpenGVLab/Ask-Anything) |
| 2023 | **Video-LLaMA** | Aligns visual and audio streams with an instruction-tuned language model. | [📄](https://arxiv.org/abs/2306.02858) [💻](https://github.com/DAMO-NLP-SG/Video-LLaMA) |
| 2024 | **LLaMA-VID** | Compresses each frame into two tokens for efficient long-video processing. | [📄](https://arxiv.org/abs/2311.17043) [💻](https://github.com/dvlab-research/LLaMA-VID) |
| 2024 | **LLaVA-Video** | Scales video instruction tuning with synthetic video data. | [📄](https://arxiv.org/abs/2410.02713) [💻](https://github.com/LLaVA-VL/LLaVA-NeXT) |
| 2025 | **Video-SALMONN 2** | Strengthens fine-grained audio-visual understanding using caption-enhanced training. | [📄](https://arxiv.org/abs/2506.15220) |

## 🎬 Video-LLMs

### Basic encoding

> Encode sampled frames independently with an image encoder, or model motion directly with a video-native encoder.

- **CLIP** — The standard image-text aligned visual backbone behind many early Video-LLMs. [📄](https://arxiv.org/abs/2103.00020) [💻](https://github.com/openai/CLIP)
- **SigLIP** — Replaces softmax contrastive learning with a sigmoid loss and scales efficiently. [📄](https://arxiv.org/abs/2303.15343) [💻](https://github.com/google-research/big_vision)
- **InternVideo** — A video-native encoder that explicitly models temporal dynamics. [📄](https://arxiv.org/abs/2212.03191) [💻](https://github.com/OpenGVLab/InternVideo)
- **InternVideo2** — Scales video foundation learning through masked token reconstruction and cross-modal contrastive objectives. [📄](https://arxiv.org/abs/2403.15377) [💻](https://github.com/OpenGVLab/InternVideo2)

### Long-context encoding

| Strategy | Representative work | Core idea | Resources |
|---|---|---|:---:|
| Token pooling | **PLLaVA** | Adaptive spatial pooling preserves temporal order while reducing visual tokens. | [📄](https://arxiv.org/abs/2404.16994) [💻](https://github.com/magic-research/PLLaVA) |
| Token abstraction | **LLaMA-VID** | Represents one frame with a context token and a content token. | [📄](https://arxiv.org/abs/2311.17043) [💻](https://github.com/dvlab-research/LLaMA-VID) |
| Memory | **MovieChat** | Uses short- and long-term memory to process videos beyond the context window. | [📄](https://arxiv.org/abs/2307.16449) [💻](https://github.com/rese1f/MovieChat) |
| Adaptive compression | **LongVU** | Removes redundant frames and preserves query-relevant detail at higher fidelity. | [📄](https://arxiv.org/abs/2410.17434) [💻](https://github.com/Vision-CAIR/LongVU) |
| Context transfer | **LongVA** | Transfers text-only long-context ability to video without long-video training. | [📄](https://arxiv.org/abs/2406.16852) [💻](https://github.com/EvolvingLMMs-Lab/LongVA) |
| Sequence parallelism | **LongVILA** | Extends VILA to thousands of frames through staged training and distributed systems. | [📄](https://arxiv.org/abs/2408.10188) [💻](https://github.com/NVlabs/VILA) |

### Streaming encoding

- **Flash-VStream** — Maintains a compact spatiotemporal memory for real-time video dialogue. [📄](https://arxiv.org/abs/2406.08085) [💻](https://github.com/IVGSZ/Flash-VStream)
- **StreamChat** — Updates visual context incrementally with a streaming cache. [📄](https://arxiv.org/abs/2409.14738)
- **StreamingVLM** — Preserves recent visual evidence while evicting redundant historical tokens. [📄](https://arxiv.org/abs/2503.10622)
- **VideoChat-Online** — Uses hierarchical memories and dynamic frame eviction for online dialogue. [📄](https://arxiv.org/search/?query=VideoChat-Online&searchtype=all)

### Multimodal alignment

| Family | Representative systems | Strength | Limitation |
|---|---|---|---|
| **Projection-based** | LLaVA-NeXT-Video, Qwen2-VL, InternVL | Simple, stable, parameter-efficient | Token count grows with frames |
| **Query-based** | BLIP-2, Video-LLaMA, VideoChat, TimeChat | Fixed or adaptive visual abstraction | May lose spatial and fine-grained detail |
| **Audio-visual** | video-SALMONN, Video-LLaMA 2 | Adds speech, music, and environmental cues | Fine-grained temporal alignment remains difficult |

Selected resources:

- **BLIP-2** — Introduces Q-Former, the canonical learnable-query alignment module. [📄](https://arxiv.org/abs/2301.12597) [💻](https://github.com/salesforce/LAVIS)
- **TimeChat** — Uses a sliding video Q-Former for timestamp-aware long-video understanding. [📄](https://arxiv.org/abs/2312.02051) [💻](https://github.com/RenShuhuai-Andy/TimeChat)
- **Qwen2-VL** — Provides dynamic-resolution visual tokenization and multimodal rotary position encoding. [📄](https://arxiv.org/abs/2409.12191) [💻](https://github.com/QwenLM/Qwen2-VL)

## 🧪 Training resources

### Pre-training datasets

| Dataset | Modality | Scale / focus | Resources |
|---|---|---|:---:|
| **WebVid-2M** | Video–text | Large-scale web video captions | [📄](https://arxiv.org/abs/2104.00650) [🤗](https://huggingface.co/datasets/TempoFunk/webvid-10M) |
| **HowTo100M** | Video–speech | Instructional videos with narrated text | [📄](https://arxiv.org/abs/1906.03327) [🌐](https://www.di.ens.fr/willow/research/howto100m/) |
| **InternVid** | Video–text | Large, diverse video-text pre-training corpus | [📄](https://arxiv.org/abs/2307.06942) [💻](https://github.com/OpenGVLab/InternVideo) |
| **Panda-70M** | Video–text | High-quality captions generated at web scale | [📄](https://arxiv.org/abs/2402.19479) [🌐](https://snap-research.github.io/Panda-70M/) |

### Instruction and preference data

- **VideoInstruct-100K** — Video instruction data introduced with VideoChatGPT. [📄](https://arxiv.org/abs/2306.05424) [💻](https://github.com/mbzuai-oryx/Video-ChatGPT)
- **ShareGPT4Video** — Detailed video captions and instruction data generated with an efficient captioner. [📄](https://arxiv.org/abs/2406.04325) [💻](https://github.com/ShareGPT4Omni/ShareGPT4Video)
- **LLaVA-Video-178K** — Synthetic instruction data covering open-ended video understanding tasks. [📄](https://arxiv.org/abs/2410.02713) [🤗](https://huggingface.co/datasets/lmms-lab/LLaVA-Video-178K)
- **VideoDPO** — Preference optimization data for reducing video-language hallucination and improving alignment. [📄](https://arxiv.org/search/?query=VideoDPO&searchtype=all)

### Training paradigms

- **Pre-training** — Learn general visual and temporal representations from large-scale paired data.
- **Instruction tuning** — Convert perception into conversational, question-answering, captioning, and grounding capabilities.
- **Preference alignment** — Use DPO, RLAIF, PPO, or GRPO to improve helpfulness, reasoning, and faithfulness.
- **Training-free systems** — Compose frozen encoders, captioners, retrievers, memories, and LLM agents at inference time.

## 📊 Evaluation

### General and long-video understanding

| Benchmark | Primary focus | Format | Resources |
|---|---|---|:---:|
| **MVBench** | 20 temporal and multimodal video tasks | Multiple choice | [📄](https://arxiv.org/abs/2311.17005) [💻](https://github.com/OpenGVLab/Ask-Anything) |
| **Video-MME** | Duration-, domain-, and modality-balanced evaluation | Multiple choice | [📄](https://arxiv.org/abs/2405.21075) [💻](https://github.com/BradyFU/Video-MME) |
| **MLVU** | Multi-task long-video understanding | Mixed | [📄](https://arxiv.org/abs/2406.04264) [💻](https://github.com/JUNJIE99/MLVU) |
| **LongVideoBench** | Interleaved video-language reasoning over long contexts | Multiple choice | [📄](https://arxiv.org/abs/2407.15754) [💻](https://github.com/longvideobench/LongVideoBench) |
| **LVBench** | Hour-long real-world video understanding | Multiple choice | [📄](https://arxiv.org/abs/2406.08035) [💻](https://github.com/wangzongyu-ustc/LVBench) |

### Temporal, streaming, and fine-grained evaluation

- **TempCompass** — Diagnoses temporal perception through counterfactual and caption-based tasks. [📄](https://arxiv.org/abs/2403.00476) [💻](https://github.com/llyx97/TempCompass)
- **StreamingBench** — Measures perception, memory, and reasoning over streaming video. [📄](https://arxiv.org/abs/2411.03628) [💻](https://github.com/THUNLP-MT/StreamingBench)
- **OVO-Bench** — Evaluates online video understanding under temporal constraints. [📄](https://arxiv.org/search/?query=OVO-Bench&searchtype=all)
- **MotionBench** — Tests whether models truly perceive motion rather than rely on static cues. [📄](https://arxiv.org/search/?query=MotionBench&searchtype=all)

## 🔭 Challenges and frontiers

```text
Video-LLMs
├── Perception       → fine detail, motion, audio, OCR, spatial grounding
├── Temporal memory  → long context, streaming, event boundaries
├── Reasoning        → causality, compositionality, multi-step inference
├── Reliability      → hallucination, calibration, evidence attribution
├── Efficiency       → token compression, adaptive compute, edge inference
└── Responsibility   → privacy, bias, safety, provenance
```

- **Faithful generation** — Ground every claim in visible or audible evidence and evaluate counterfactual robustness.
- **Adaptive computation** — Spend dense computation only on query-relevant moments without discarding brief events.
- **True audio-visual reasoning** — Align sounds to the frames and sources that produce them.
- **Interactive streaming** — Decide not only *what* to answer, but *when* to respond during an ongoing stream.
- **Better data** — Combine scalable model-generated annotations with targeted human verification.

## 🤝 Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request. A good addition includes a stable paper link, an official code or project link when available, and one sentence explaining why the work belongs in its category.

## 🙏 Acknowledgements

The presentation follows the curation principles of the [Awesome manifesto](https://github.com/sindresorhus/awesome/blob/main/awesome.md) and draws organizational inspiration from established multimodal research lists such as [Awesome Multimodal Large Language Models](https://github.com/BradyFU/Awesome-Multimodal-Large-Language-Models).

## 📜 License

To the extent possible under law, the maintainers have waived copyright and related rights to this curated list under [CC0 1.0](LICENSE). Individual papers, codebases, models, and datasets retain their original licenses.

<p align="right"><a href="#">Back to top ↑</a></p>
