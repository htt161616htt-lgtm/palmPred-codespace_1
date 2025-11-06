#!/usr/bin/env bash
set -e

# Update system
apt-get update && apt-get install -y \
    wget \
    unzip \
    python3-pip

# Download PalmPred (replace link with real one later)
wget -O palmPred.zip "<PASTE_PALMPRED_DOWNLOAD_URL_HERE>"
unzip palmPred.zip -d palmPred
cd palmPred

pip install -r requirements.txt || true
chmod +x palmPred.py

echo "PalmPred installation complete. Run with: python3 palmPred.py <input.fasta>"
