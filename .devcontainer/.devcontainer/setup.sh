#!/usr/bin/env bash
set -e

# Update system
sudo apt-get update && sudo apt-get install -y \
    python3 python3-pip python3-venv git wget unzip

# Create Python virtual environment
python3 -m venv palm-env
source palm-env/bin/activate

# Install core packages
pip install --upgrade pip
pip install biopython numpy pandas scikit-learn joblib

# Clone PalmPred repository
if [ ! -d "PalmPred" ]; then
    git clone https://github.com/Wenlab/PalmPred.git
fi

cd PalmPred

# Install PalmPred dependencies
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt || true
fi

chmod +x palm_pred.py || true

echo ""
echo "✅ PalmPred installation complete!"
echo "👉 To start: source palm-env/bin/activate"
echo "👉 Then run: python PalmPred/palm_pred.py --help"
