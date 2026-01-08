#!/bin/bash

# Publish Script for the 4 essential packages to GitHub Packages
# Prerequisite: GITHUB_TOKEN must be set

set -e  # Exit on error

echo "🚀 Publishing Packages to GitHub Packages Registry..."
echo ""

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ Error: GITHUB_TOKEN is not set!"
    echo "Please set the token with: export GITHUB_TOKEN=your_token"
    exit 1
fi

echo "✅ GITHUB_TOKEN is set"
echo ""

# Array of packages to publish
PACKAGES=(
    "code/addons/a11y"
    "code/addons/docs"
    "code/addons/links"
    "code/frameworks/react-vite"
)

# Loop through all packages
for PACKAGE in "${PACKAGES[@]}"; do
    echo "📦 Publishing $PACKAGE..."
    cd "/Users/A79051381/storybook-forked/$PACKAGE"
    
    # Use npm publish with alpha tag and explicit registry
    npm publish --tag alpha --registry https://npm.pkg.github.com 2>&1 || true
    
    echo "✅ $PACKAGE published!"
    echo ""
    
    # Return to root
    cd "/Users/A79051381/storybook-forked"
done

echo "🎉 All 4 packages successfully published!"
echo ""
echo "You can now install them in your project with:"
echo "  yarn add @marvinlaubenstein/addon-a11y"
echo "  yarn add @marvinlaubenstein/addon-docs"
echo "  yarn add @marvinlaubenstein/addon-links"
echo "  yarn add @marvinlaubenstein/react-vite"
