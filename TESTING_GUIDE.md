# Testing Guide - Local Preview

## ⚠️ Important: URL Structure

Your resume uses a **project site** structure, not a user site. This means:

### GitHub Pages URLs (After Deployment)
```
https://1998x-stack.github.io/resume/       ← English
https://1998x-stack.github.io/resume/zh/    ← Chinese
```

### Local Testing URLs
```
http://localhost:8000/resume/              ← English
http://localhost:8000/resume/zh/           ← Chinese
```

**Note**: The `/resume/` part is required! Don't use `http://localhost:8000/` alone.

## 🧪 Testing Methods

### Method 1: Direct File Opening (Quick Test)

Works immediately without a server:

```bash
cd /Users/mx/Desktop/xieMing

# English
open resume/index.html

# Chinese
open resume/zh/index.html
```

**Pros**: Instant, no server needed
**Cons**: Doesn't test full URL structure

### Method 2: Local Server (Recommended)

Tests the exact GitHub Pages structure:

```bash
cd /Users/mx/Desktop/xieMing

# Start server FROM PROJECT ROOT
python3 -m http.server 8000
```

Then visit:
- English: `http://localhost:8000/resume/`
- Chinese: `http://localhost:8000/resume/zh/`

**Pros**: Matches production exactly
**Cons**: Requires server running

### Method 3: Interactive Script

Guided testing with menu:

```bash
cd /Users/mx/Desktop/xieMing
./scripts/test-local.sh
```

## ❌ Common Mistakes

### Mistake 1: Running server from wrong directory

```bash
# ❌ WRONG
cd /Users/mx/Desktop/xieMing/resume
python3 -m http.server 8000
# This breaks asset paths!

# ✅ CORRECT
cd /Users/mx/Desktop/xieMing
python3 -m http.server 8000
```

### Mistake 2: Using wrong URL

```bash
# ❌ WRONG
http://localhost:8000/
# This shows redirect page, not resume

# ✅ CORRECT
http://localhost:8000/resume/
# This shows your actual resume
```

### Mistake 3: Missing /resume/ in URL

```bash
# ❌ WRONG
http://localhost:8000/index.html
# 404 error

# ✅ CORRECT
http://localhost:8000/resume/
# or
http://localhost:8000/resume/index.html
```

## 📁 File Structure Reference

When server runs from project root, paths work like this:

```
Project Root (where you run server)
├── index.html                    → http://localhost:8000/
├── resume/
│   ├── index.html               → http://localhost:8000/resume/
│   └── zh/
│       └── index.html           → http://localhost:8000/resume/zh/
└── assets/
    ├── css/style.css            → http://localhost:8000/assets/css/style.css
    └── js/script.js             → http://localhost:8000/assets/js/script.js
```

## 🔍 Troubleshooting

### Issue: 404 errors for assets

**Problem**: Assets not loading (CSS, JS)

**Solution**:
1. Verify you're in project root: `pwd` should show `/Users/mx/Desktop/xieMing`
2. Check assets exist: `ls assets/css/style.css`
3. Restart server from correct directory

```bash
cd /Users/mx/Desktop/xieMing
python3 -m http.server 8000
```

### Issue: Page shows but no styling

**Problem**: HTML loads but no CSS/styling

**Check**:
1. Browser console (F12) for errors
2. Verify CSS file path in HTML: `<link rel="stylesheet" href="../assets/css/style.css">`
3. Confirm file exists: `ls assets/css/style.css`

### Issue: No data showing

**Problem**: Skills, experience, projects not displaying

**Check**:
1. JavaScript console for errors (F12 → Console)
2. Verify data files exist:
   ```bash
   ls assets/js/data-config.js
   ls assets/js/data-config-zh.js
   ls assets/js/data-repos.js
   ```
3. Check if files are loaded (Network tab in browser dev tools)

### Issue: Server runs but can't access

**Problem**: Server starts but browser can't connect

**Solution**:
1. Check port is correct: `8000`
2. Try different port: `python3 -m http.server 9000`
3. Check firewall settings
4. Try `http://127.0.0.1:8000/resume/` instead of localhost

## ✅ Verification Checklist

Before deploying, verify locally:

- [ ] English resume loads at `http://localhost:8000/resume/`
- [ ] Chinese resume loads at `http://localhost:8000/resume/zh/`
- [ ] Language switcher works (EN ↔ ZH)
- [ ] Theme toggle works (Light ↔ Dark)
- [ ] Personal info displays correctly
- [ ] Skills section shows all items
- [ ] Work experience displays
- [ ] Projects load (100+ repos)
- [ ] Project filtering works
- [ ] Search functionality works
- [ ] Mobile responsive (test with browser DevTools)

## 🚀 Ready to Deploy?

Once local testing passes:

1. **Commit changes**:
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push
   ```

2. **Wait 1-2 minutes** for GitHub Actions

3. **Visit production**:
   - `https://1998x-stack.github.io/resume/`
   - `https://1998x-stack.github.io/resume/zh/`

## 📞 Quick Reference Commands

```bash
# Test directly
open resume/index.html

# Server test
cd /Users/mx/Desktop/xieMing
python3 -m http.server 8000
# Visit: http://localhost:8000/resume/

# Interactive test
./scripts/test-local.sh

# Update repos
./scripts/update-repos.sh

# Stop server
Ctrl+C
```

## 🎯 Key Points to Remember

1. **Always run server from project root** (`/Users/mx/Desktop/xieMing/`)
2. **Use `/resume/` in URLs** (both local and production)
3. **Assets are at `/assets/`** relative to project root
4. **HTML files expect `../assets/`** relative path
5. **Server URL structure matches GitHub Pages exactly**

---

**Happy testing!** 🧪

If you encounter issues not covered here, check the browser console (F12) for error messages.
