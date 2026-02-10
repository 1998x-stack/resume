#!/bin/bash

# Test Validation Script
# Mimics GitHub Actions validation checks
# Run this before pushing to catch errors early

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         Testing Deployment Validation (Like CI/CD)          ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Track if any checks fail
FAILED=0

# ============================================================
# 1. Validate File Structure
# ============================================================
echo "🔍 Step 1: Validating file structure..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

REQUIRED_FILES=(
    "index.html"
    "resume/index.html"
    "resume/zh/index.html"
    "assets/css/style.css"
    "assets/js/script.js"
    "assets/js/data-config.js"
    "assets/js/data-config-zh.js"
    "assets/js/data-repos.js"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ Found: $file"
    else
        echo "  ❌ Missing: $file"
        FAILED=1
    fi
done

if [ $FAILED -eq 0 ]; then
    echo ""
    echo "✅ All required files present!"
else
    echo ""
    echo "❌ Some files are missing!"
fi

echo ""

# ============================================================
# 2. Validate JSON Files
# ============================================================
echo "🔍 Step 2: Validating JSON data files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

JSON_FILES=(
    "assets/data/config.json"
    "assets/data/config-zh.json"
    "assets/data/repos.json"
)

JSON_VALID=1
for file in "${JSON_FILES[@]}"; do
    if [ -f "$file" ]; then
        if python3 -m json.tool "$file" > /dev/null 2>&1; then
            echo "  ✅ Valid JSON: $file"
        else
            echo "  ❌ Invalid JSON: $file"
            JSON_VALID=0
            FAILED=1
        fi
    else
        echo "  ⚠️  Not found: $file (optional)"
    fi
done

if [ $JSON_VALID -eq 1 ]; then
    echo ""
    echo "✅ All JSON files valid!"
else
    echo ""
    echo "❌ Some JSON files have syntax errors!"
    echo "   💡 Fix with: ./scripts/regenerate-data.sh"
fi

echo ""

# ============================================================
# 3. Check JavaScript Files
# ============================================================
echo "🔍 Step 3: Checking JavaScript files..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

JS_VALID=1
for file in assets/js/*.js; do
    if [ -s "$file" ]; then
        size=$(wc -c < "$file")
        echo "  ✅ $file (${size} bytes)"
    else
        echo "  ❌ Empty file: $file"
        JS_VALID=0
        FAILED=1
    fi
done

if [ $JS_VALID -eq 1 ]; then
    echo ""
    echo "✅ All JavaScript files valid!"
else
    echo ""
    echo "❌ Some JavaScript files are empty!"
    echo "   💡 Fix with: ./scripts/regenerate-data.sh"
fi

echo ""

# ============================================================
# 4. Additional Checks
# ============================================================
echo "🔍 Step 4: Additional checks..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check if HTML files load scripts correctly
HTML_CHECK=1
if grep -q 'src="../assets/js/data-config.js"' resume/index.html; then
    echo "  ✅ English HTML loads data correctly"
else
    echo "  ❌ English HTML missing data script"
    HTML_CHECK=0
    FAILED=1
fi

if grep -q 'src="../../assets/js/data-config-zh.js"' resume/zh/index.html; then
    echo "  ✅ Chinese HTML loads data correctly"
else
    echo "  ❌ Chinese HTML missing data script"
    HTML_CHECK=0
    FAILED=1
fi

if [ $HTML_CHECK -eq 1 ]; then
    echo ""
    echo "✅ HTML files configured correctly!"
else
    echo ""
    echo "❌ HTML files need script path fixes!"
fi

echo ""

# ============================================================
# 5. Data Consistency Check
# ============================================================
echo "🔍 Step 5: Data consistency check..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

python3 << 'PYEOF'
import json, sys, os

checks_passed = True

# Check if JS files match JSON sources
try:
    # Read JSON
    with open('assets/data/config.json', 'r') as f:
        json_data = json.load(f)
    
    # Read JS file
    with open('assets/js/data-config.js', 'r') as f:
        js_content = f.read()
    
    # Simple check - look for name in JS
    if json_data['personal']['name'] in js_content:
        print("  ✅ English data JS matches JSON source")
    else:
        print("  ❌ English data JS doesn't match JSON source")
        checks_passed = False
        
except Exception as e:
    print(f"  ❌ Error checking English data: {e}")
    checks_passed = False

try:
    # Read JSON
    with open('assets/data/config-zh.json', 'r') as f:
        json_data = json.load(f)
    
    # Read JS file
    with open('assets/js/data-config-zh.js', 'r') as f:
        js_content = f.read()
    
    # Simple check
    if json_data['personal']['name'] in js_content:
        print("  ✅ Chinese data JS matches JSON source")
    else:
        print("  ❌ Chinese data JS doesn't match JSON source")
        checks_passed = False
        
except Exception as e:
    print(f"  ❌ Error checking Chinese data: {e}")
    checks_passed = False

if checks_passed:
    print("")
    print("✅ Data files are in sync!")
else:
    print("")
    print("❌ Data files out of sync!")
    print("   💡 Fix with: ./scripts/regenerate-data.sh")
    sys.exit(1)
PYEOF

if [ $? -ne 0 ]; then
    FAILED=1
fi

echo ""

# ============================================================
# Final Result
# ============================================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ $FAILED -eq 0 ]; then
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                                                              ║"
    echo "║             ✅ ALL VALIDATION CHECKS PASSED! ✅              ║"
    echo "║                                                              ║"
    echo "║         Your resume is ready for deployment! 🚀              ║"
    echo "║                                                              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "💡 Next steps:"
    echo "   1. Test locally: python3 -m http.server 8000"
    echo "   2. Commit: git add . && git commit -m 'Your message'"
    echo "   3. Push: git push"
    echo ""
    echo "The GitHub Actions workflow will:"
    echo "   ✓ Run these same checks"
    echo "   ✓ Deploy to GitHub Pages if all checks pass"
    echo "   ✓ Your site will be live in ~2-4 minutes"
    echo ""
    exit 0
else
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                                                              ║"
    echo "║             ❌ VALIDATION CHECKS FAILED! ❌                  ║"
    echo "║                                                              ║"
    echo "║         Fix the issues above before deploying                ║"
    echo "║                                                              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "💡 Quick fixes:"
    echo "   • Missing files: git status (check for deletions)"
    echo "   • Invalid JSON: ./scripts/regenerate-data.sh"
    echo "   • Empty JS: ./scripts/regenerate-data.sh"
    echo "   • Out of sync: ./scripts/regenerate-data.sh"
    echo ""
    echo "After fixing, run this script again to verify."
    echo ""
    exit 1
fi
