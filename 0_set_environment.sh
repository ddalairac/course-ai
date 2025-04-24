#!/bin/bash

echo "🌱 Creating virtual environment 'ai-env'..."
python3 -m venv ai-env
source ai-env/bin/activate

echo "📦 Upgrading pip..."
pip install --upgrade pip

echo "🚀 Installing Jupyter Notebook..."
pip install notebook ipykernel

echo "📚 Installing AI packages..."
pip install \
    torch \          # PyTorch: Deep learning framework
    numpy \          # NumPy: Numerical computing and arrays
    matplotlib \     # Matplotlib: Data visualization
    accelerate \     # Accelerate: Hugging Face models optimization
    transformers \   # Transformers: Language models library
    sentencepiece \  # SentencePiece: Text tokenization
    datasets \       # Datasets: Dataset management
    langchain \      # LangChain: Framework for LLM applications
    torchrl \        # TorchRL: Reinforcement Learning with PyTorch
    llama-index \    # LlamaIndex: Document indexing and search
    bertviz \        # BertViz: Language model visualization
    wikipedia \      # Wikipedia: Wikipedia API access
    langchain_community \  # LangChain community extensions
    langchain_nvidia_ai_endpoints==0.3.9 \  # NVIDIA models integration
    python-dotenv==1.1.0  # Environment variables management

# 🆕 Additional dependencies
echo "➕ Installing extra useful packages..."
pip install sentence-transformers ipywidgets huggingface_hub

echo "🔧 Enabling ipywidgets support (optional)..."
jupyter nbextension enable --py widgetsnbextension --sys-prefix || true

echo "🔗 Registering Jupyter kernel as 'Python (AI Env)'..."
python -m ipykernel install --user --name=ai-env --display-name "Python (AI Env)"

echo "✅ Done! Launching Jupyter Notebook..."
jupyter notebook
