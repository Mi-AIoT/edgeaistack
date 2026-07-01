# EdgeAI Stack

AmbiqAI 生态系统的一站式 Docker 镜像，集成所有活跃的 GitHub 仓库和 PyPI 工具包源码。

## 包含内容

### GitHub 仓库（21 个，2026 年活跃）

| 仓库 | 语言 | 说明 |
|------|------|------|
| nsx-ambiq-sdk | C | Ambiq 统一 SDK monorepo |
| ns-cmsis-nn | C | heliaCORE NN 内核库 |
| neuralspotx | Python | neuralSPOT X 工具链和 CLI |
| helia-rt | C++ | Ambiq 优化的 TFLM fork |
| neuralSPOT | C | Ambiq AI SDK 和工具包 |
| helia-edge | Python | 边缘 AI Keras 插件 |
| heartkit | Python | AI 心脏监测 |
| sleepkit | Python | AI 睡眠监测 |
| physiokit | Python | 生物信号处理 |
| DeepFilterNet_tf | Python | 深度滤波降噪 |
| soundkit | C | 轻量级音频智能工具包 |
| helia-core-tester | Python | 核心测试工具 |
| 其他 | C/CMake | nsx-opus, nsx-sensors, nsx-nanopb 等 |

### AITG PyPI 源码包（7 个）

`helia-edge`, `physiokit`, `heartkit`, `neuralspotx`, `sleepkit`, `helia-aot`, `neuralspot-edge`

## 快速开始

```bash
# 拉取最新镜像
docker pull ghcr.io/mi-aiot/edgeaistack:latest

# 运行
docker run -it ghcr.io/mi-aiot/edgeaistack:latest

# 进入指定仓库目录
docker run -it ghcr.io/mi-aiot/edgeaistack:latest bash -c "cd /workspace/neuralSPOT && ls"
```

## 镜像标签

| 标签 | 说明 |
|------|------|
| `latest` | 最新构建 |
| `YYYY.MM.DD` | 日期版本，如 `2026.07.01` |
| `<commit-sha>` | Git commit SHA，如 `c18b9f7` |

## 构建

### 自动构建

- **每月 1 号 UTC 02:00** 自动构建并推送
- 支持在 GitHub Actions 页面手动触发

### 本地构建

```bash
docker build -t edgeaistack:local .
```

## 架构

```
workspace/
├── neuralSPOT/          # Git 仓库（保留完整历史）
├── helia-edge/
├── heartkit/
├── ...
├── aitg-packages/       # AITG PyPI 源码包
│   ├── helia_edge-0.3.0.tar.gz
│   ├── heartkit-1.6.0.tar.gz
│   └── ...
└── repos.txt            # 仓库列表
```

## 自定义

编辑 `repos.txt` 添加或移除仓库，格式：`<owner>/<repo> [branch]`

```txt
AmbiqAI/neuralSPOT
AmbiqAI/helia-edge main
```
