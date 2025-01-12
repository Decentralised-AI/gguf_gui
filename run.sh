#!/bin/bash

# Repository name
REPO_NAME="llama.cpp"

# Function to check if a directory is a git repository
is_git_repo() {
    git -C "$1" rev-parse --is-inside-work-tree > /dev/null 2>&1
}

# Check if the repository directory exists and is a git repository
if [ -d "$REPO_NAME" ] && is_git_repo "$REPO_NAME"; then
    echo "The $REPO_NAME repository already exists in the current directory."
else
    echo "No $REPO_NAME repository found in the current directory. Cloning repository..."
    git clone https://github.com/ggerganov/llama.cpp.git
fi


pip install -r "llama.cpp/requirements/requirements-convert-hf-to-gguf.txt"
# CMAKE_ARGS="-DLLAMA_CUDA=on" pip install llama-cpp-python
pip install llama-cpp-python
pip install streamlit
pip install --upgrade huggingface_hub
streamlit run main.py
