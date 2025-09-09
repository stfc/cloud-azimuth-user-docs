---
hide:
  - footer
---
!!! Warning

    Deploying Huggingface-LLM requires an existing [Kubernetes cluster](../kubernetes.md), with a GPU-enabled node group.

!!! Bug
    If HuggingFace is deployed onto a cluster without a GPU-enabled node group, or there is some vLLM error during deployment, it may get stuck in the "Installing" state and refuse to uninstall. If this happens, delete the `huggingface-api` object and/or the entire associated namespace via `kubectl` or the [Kubernetes Dashboard](../kubernetes-cluster-addons/kubernetes_dashboard.md). The uninstall process should then successfully complete.

### Introduction
A generative AI chatbot service backed by a [HuggingFace](https://huggingface.co/) model, exposed via a convenient web interface.

### Launch configuration

To get started, in the Platforms tab, press the <img loading="lazy" class="off-glb" src="../../../assets/images/new-platform-button.svg" style="height:1em; vertical-align:middle;"> New Platform button, and select HuggingFace LLM.


!!! Warning
    Please be conscious of UKRI and the STFC's security policies when selecting a model. For example, DeepSeek cannot be used on the STFC Cloud Platform.

You will then be presented with launch configuration options to fill in:

|**Option**                                | **Explanation**|
|------------------------------------------|---------------------------|
|Platform name|A name to identify the HuggingFace LLM platform|
|Kubernetes cluster|The Kubernetes platform on which to deploy HuggingFace LLM. If one hasn't already been created, check out the [Kubernetes Overview](../kubernetes.md).|
|App version|The version of the HuggingFace LLM Azimuth Application to use.|
|Model|The model to deploy from [HuggingFace](https://huggingface.co/models). [vLLM](https://docs.vllm.ai/en/latest/index.html) is used for model serving, so any of their [supported models](https://docs.vllm.ai/en/latest/models/supported_models.html) should work.|
|Access Token|HuggingFace [https://huggingface.co/docs/hub/security-tokens](https://huggingface.co/docs/hub/security-tokens) which is required for some [gated models](https://huggingface.co/docs/hub/en/models-gated)|
|Instruction|The initial system prompt, hidden from the user, which is used when generating responses|
|Page Title|The title displayed at the top of the chat interface|
|Backend vLLM Version|The version of vLLM to use from [this list](https://github.com/vllm-project/vllm/tags)|
|LLM Sampling Parameters (Temperature, Frequency etc)| See [the vLLM docs](https://docs.vllm.ai/en/latest/api/vllm/index.html#vllm.SamplingParams)|
|Max Tokens|Maximum number of [tokens](https://platform.openai.com/tokenizer) to generate per response. Use this to moderate compute cost.|
|Model Context Length|Override for the model's maximum context length|

It may take a long time for HuggingFace to install. Progress can be checked via the `huggingface-api` pod's logs. These can be accessed in `kubectl` or the [Kubernetes Dashboard](../kubernetes-cluster-addons/kubernetes_dashboard.md).