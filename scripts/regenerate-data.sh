#!/bin/bash

# Regenerate Data Files from JSON sources
# This script converts JSON configs to JavaScript data files

echo "🔄 Regenerating data files..."
echo ""

# Regenerate English config
echo "📝 Generating English config..."
python3 << 'PYEOF'
import json
with open('assets/data/config.json', 'r', encoding='utf-8') as f:
    config = json.load(f)
js_content = 'window.resumeConfig = ' + json.dumps(config, ensure_ascii=False, indent=2) + ';'
with open('assets/js/data-config.js', 'w', encoding='utf-8') as f:
    f.write(js_content)
print("✅ Generated assets/js/data-config.js")
PYEOF

# Regenerate Chinese config
echo "📝 Generating Chinese config..."
python3 << 'PYEOF'
import json
with open('assets/data/config-zh.json', 'r', encoding='utf-8') as f:
    config = json.load(f)
js_content = 'window.resumeConfig = ' + json.dumps(config, ensure_ascii=False, indent=2) + ';'
with open('assets/js/data-config-zh.js', 'w', encoding='utf-8') as f:
    f.write(js_content)
print("✅ Generated assets/js/data-config-zh.js")
PYEOF

echo ""
echo "✅ All data files regenerated!"
echo ""
echo "💡 Next steps:"
echo "   1. Test locally: python3 -m http.server 8000"
echo "   2. Visit: http://localhost:8000/resume/"
echo "   3. If OK: git add assets/ && git commit -m 'Update data'"
