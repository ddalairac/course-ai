#!/bin/bash

set -e  # Stop the script if any command fails

echo "🌱 Creating virtual environment 'ai-env'..."
python3 -m venv ai-env
source ai-env/bin/activate

echo "📦 Upgrading pip..."
pip install --upgrade pip

echo "🚀 Installing Jupyter Notebook and kernel support..."
pip install notebook ipykernel

echo "📚 Installing AI & ML packages..."
pip install \
    torch \
    numpy \
    matplotlib \
    accelerate \
    transformers \
    sentencepiece \
    datasets \
    langchain \
    torchrl \
    llama-index \
    bertviz \
    wikipedia \
    langchain_community \
    sentence-transformers \
    ipywidgets \
    huggingface_hub

echo "🔧 Enabling ipywidgets support (optional)..."
jupyter nbextension enable --py widgetsnbextension --sys-prefix || true

echo "🔗 Registering Jupyter kernel as 'Python (AI Env)'..."
python -m ipykernel install --user --name=ai-env --display-name "Python (AI Env)"

echo "✅ Environment setup complete!"
echo "📖 Launching Jupyter Notebook..."
jupyter notebook
