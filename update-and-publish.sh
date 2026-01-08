#!/bin/bash

# Update & Publish Script for Storybook Packages
# Use this script to publish updates

set -e

echo "🔄 Storybook Packages Update & Publish"
echo "======================================"
echo ""

# 1. Check if we're in the correct directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Please run this script from the repository root"
    exit 1
fi

# 2. Check git status
if [[ -n $(git status -s) ]]; then
    echo "⚠️  Warning: There are uncommitted changes!"
    echo "Do you want to continue? (y/n)"
    read -r response
    if [[ "$response" != "y" ]]; then
        echo "Aborted."
        exit 0
    fi
fi

# 3. Compile
echo "📦 Compiling all packages..."
gtimeout 600s yarn task --task compile

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed!"
    exit 1
fi

echo ""
echo "✅ Compilation successful!"
echo ""

# 4. Publishing
echo "🚀 Publishing Packages..."
echo ""

PACKAGES=(
    "code/addons/a11y"
    "code/addons/docs"
    "code/addons/links"
    "code/frameworks/react-vite"
)

for PACKAGE in "${PACKAGES[@]}"; do
    echo "📦 Publishing $PACKAGE..."
    npm publish --tag alpha "$PACKAGE"
    
    if [ $? -ne 0 ]; then
        echo "❌ Publishing $PACKAGE failed!"
        exit 1
    fi
    
    echo "✅ $PACKAGE published!"
    echo ""
done

echo ""
echo "🎉 All packages successfully published!"
echo ""
echo "Next steps in your project:"
echo "  1. yarn upgrade @marvinlaubenstein/addon-a11y"
echo "  2. yarn upgrade @marvinlaubenstein/addon-docs"
echo "  3. yarn upgrade @marvinlaubenstein/addon-links"
echo "  4. yarn upgrade @marvinlaubenstein/react-vite"
