#!/bin/bash

# Test Script for Local Resume Viewing

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║       Testing Bilingual Resume - Local Preview              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check if we're in the right directory
if [ ! -f "resume/index.html" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    echo "   (The directory containing 'resume/' folder)"
    exit 1
fi

echo "📋 File Check:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check critical files
files=(
    "resume/index.html"
    "resume/zh/index.html"
    "assets/js/data-config.js"
    "assets/js/data-config-zh.js"
    "assets/js/data-repos.js"
    "assets/css/style.css"
    "assets/js/script.js"
    ".github/workflows/deploy.yml"
)

all_exist=true
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file"
    else
        echo "  ✗ $file (MISSING)"
        all_exist=false
    fi
done

echo ""

if [ "$all_exist" = false ]; then
    echo "❌ Some files are missing!"
    exit 1
fi

echo "✅ All files present!"
echo ""

echo "🌐 URL Preview:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "After deployment to GitHub Pages:"
echo "  🔗 https://1998x-stack.github.io/resume/          (English)"
echo "  🔗 https://1998x-stack.github.io/resume/zh/      (Chinese)"
echo ""

echo "🧪 Testing Options:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Choose your testing method:"
echo ""
echo "1. Direct Open (Quick Test)"
echo "   English: open resume/index.html"
echo "   Chinese: open resume/zh/index.html"
echo ""
echo "2. Local Server (Full Test - Recommended)"
echo "   python3 -m http.server 8000"
echo "   Then visit:"
echo "   - http://localhost:8000/resume/       (English)"
echo "   - http://localhost:8000/resume/zh/    (Chinese)"
echo ""

read -p "Press 1 for direct open, 2 for server, or Q to quit: " choice

case $choice in
    1)
        echo ""
        echo "📂 Opening English version..."
        open resume/index.html
        sleep 1
        echo "📂 Opening Chinese version..."
        open resume/zh/index.html
        echo ""
        echo "✅ Both versions opened in browser!"
        echo "   Switch between tabs to compare."
        ;;
    2)
        echo ""
        echo "🚀 Starting local server on port 8000..."
        echo ""
        echo "📝 URLs to test:"
        echo "   Root:    http://localhost:8000/"
        echo "   English: http://localhost:8000/resume/"
        echo "   Chinese: http://localhost:8000/resume/zh/"
        echo ""
        echo "⚠️  IMPORTANT: Use /resume/ URLs (not just /)"
        echo ""
        echo "Press Ctrl+C to stop the server"
        echo ""
        python3 -m http.server 8000
        ;;
    [Qq])
        echo ""
        echo "Exiting. Test anytime by running:"
        echo "  ./scripts/test-local.sh"
        exit 0
        ;;
    *)
        echo ""
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
