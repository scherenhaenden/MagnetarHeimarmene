#!/bin/bash

# Magnetar Release Pipeline
# Packages the plasmoid for distribution

set -e

echo "Initializing Release Pipeline..."

# 1. Verification
if [ ! -f "metadata.json" ]; then
    echo "Error: metadata.json not found."
    exit 1
fi

if [ ! -d "contents" ]; then
    echo "Error: contents/ directory not found."
    exit 1
fi

# 2. Extract Version
# Prefer jq for JSON parsing; fall back to Python, then a minimal grep-based approach.
if command -v jq &> /dev/null; then
    VERSION=$(jq -r '.KPlugin.Version' metadata.json)
elif command -v python3 &> /dev/null; then
    VERSION=$(python3 -c "import json; print(json.load(open('metadata.json'))['KPlugin']['Version'])")
elif command -v python &> /dev/null; then
    VERSION=$(python -c "import json; print(json.load(open('metadata.json'))['KPlugin']['Version'])")
else
    # Last-resort fallback: regex-based extraction; may break if metadata.json layout changes.
    VERSION=$(grep -o '"Version": *"[^"]*"' metadata.json | sed -E 's/.*"Version": *"([^"]*)".*/\1/')
fi

if [ -z "$VERSION" ]; then
    echo "Error: Could not extract version from metadata.json"
    exit 1
fi

echo "Detected version: $VERSION"

# 3. Prepare Release Directory
mkdir -p releases
RELEASE_FILE="releases/MagnetarHeimarmene-v${VERSION}.plasmoid"

# 4. Package
echo "Packaging to $RELEASE_FILE..."

# Check if zip is installed
if ! command -v zip &> /dev/null; then
    echo "Error: 'zip' command not found. Please install zip."
    exit 1
fi

# Remove existing file if it exists
if [ -f "$RELEASE_FILE" ]; then
    rm "$RELEASE_FILE"
fi

# Zip recursively
zip -r -q "$RELEASE_FILE" metadata.json contents/

echo "------------------------------------------------"
echo "Release Build Successful!"
echo "Artifact: $RELEASE_FILE"
echo "------------------------------------------------"
