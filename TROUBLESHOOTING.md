# Troubleshooting Guide

## Common Issues and Solutions

### Issue: Data Not Showing in Resume

**Symptoms:**
- Resume appears blank
- Personal info missing
- Skills/experience not displaying
- Console errors about null properties

**Solution:**
```bash
# 1. Check if data files exist
ls assets/js/data-config*.js assets/js/data-repos.js

# 2. Regenerate data files
./scripts/regenerate-data.sh

# 3. Check browser console (F12) for errors
# 4. Hard refresh browser (Cmd+Shift+R or Ctrl+Shift+F5)
```

### Issue: Syntax Error in Chinese Config

**Symptoms:**
- `Uncaught SyntaxError: Unexpected identifier` in console
- Chinese version not loading
- JSON parse errors

**Cause:** Chinese quotation marks "..." in text strings

**Solution:**
```bash
# Regenerate data files (handles escaping automatically)
./scripts/regenerate-data.sh
```

**Prevention:** Always edit `assets/data/config-zh.json` and use regular quotes `"..."`, not Chinese quotes `"..."`

### Issue: 404 Errors for Assets

**Symptoms:**
- `GET http://localhost:8000/assets/css/style.css 404`
- No styling applied
- Console shows 404 errors

**Cause:** Server running from wrong directory

**Solution:**
```bash
# Always run from PROJECT ROOT
cd /Users/mx/Desktop/xieMing
python3 -m http.server 8000

# NOT from:
# cd /Users/mx/Desktop/xieMing/resume  ❌
```

### Issue: Wrong URL - Page Not Found

**Symptoms:**
- 404 error when accessing resume
- Redirect page shows instead

**Solution:**
Use correct URL with `/resume/`:
```
✅ http://localhost:8000/resume/        (English)
✅ http://localhost:8000/resume/zh/     (Chinese)
❌ http://localhost:8000/               (Redirect only)
```

### Issue: LinkedIn Link Error

**Symptoms:**
- `Cannot set properties of null (setting 'href')` error
- LinkedIn element missing

**Status:** ✅ Fixed - LinkedIn element now added with null checks

If you still see this:
```bash
# Pull latest code
git pull

# Or manually add to HTML:
# <a id="linkedin-link" href="" style="display: none;">...</a>
```

### Issue: Placeholder Image Fails

**Symptoms:**
- `ERR_CONNECTION_CLOSED` for via.placeholder.com
- Avatar not loading

**Status:** ✅ Fixed - now uses GitHub avatar

If using default config:
- Update avatar URL in `assets/data/config.json`
- Use your own image or GitHub avatar

### Issue: JSON Validation Errors

**Symptoms:**
- `Expecting ',' delimiter` errors
- `Unexpected token` errors
- Config won't load

**Solution:**
1. Validate your JSON:
   ```bash
   python3 -m json.tool assets/data/config.json
   python3 -m json.tool assets/data/config-zh.json
   ```

2. Common mistakes to avoid:
   - ❌ Trailing commas: `"value",]`
   - ❌ Missing quotes: `{name: "value"}`
   - ❌ Chinese quotes: `"值"`
   - ❌ Unescaped quotes: `"text"inner"text"`

3. After fixing, regenerate:
   ```bash
   ./scripts/regenerate-data.sh
   ```

## Updating Your Resume

### Update Personal Information

```bash
# 1. Edit JSON files
nano assets/data/config.json         # English
nano assets/data/config-zh.json      # Chinese

# 2. Regenerate JS data files
./scripts/regenerate-data.sh

# 3. Test
python3 -m http.server 8000
# Visit http://localhost:8000/resume/

# 4. Commit
git add assets/
git commit -m "Update personal information"
git push
```

### Update Projects

```bash
# 1. Fetch latest from GitHub
./scripts/update-repos.sh

# 2. Test
python3 -m http.server 8000

# 3. Commit
git add assets/
git commit -m "Update project list"
git push
```

## Browser Issues

### Cache Problems

**Solution:**
```
Hard refresh:
- macOS: Cmd + Shift + R
- Windows: Ctrl + Shift + F5
- Or: Clear browser cache in settings
```

### Console Errors

**Check errors:**
1. Press F12 (Dev Tools)
2. Go to Console tab
3. Look for red errors
4. Share error message for help

### Network Errors

**Check network:**
1. F12 → Network tab
2. Reload page
3. Look for failed requests (red)
4. Check if files are loading correctly

## File Structure Issues

### Missing Files

```bash
# Check all required files exist
ls resume/index.html
ls resume/zh/index.html
ls assets/css/style.css
ls assets/js/script.js
ls assets/js/data-*.js

# If missing, check git status
git status

# Restore if needed
git checkout <filename>
```

### Wrong Paths

HTML files expect these relative paths:
- English (`resume/index.html`): `../assets/`
- Chinese (`resume/zh/index.html`): `../../assets/`

If paths are wrong, check which HTML file you're editing!

## Deployment Issues

### GitHub Pages Not Working

**Check:**
1. Repository is public
2. Settings → Pages → Source: "GitHub Actions"
3. Workflow completed (Actions tab)
4. Wait 5 minutes, clear cache

**Debug:**
```bash
# Check workflow
# Go to: https://github.com/1998x-stack/resume/actions

# If failing, check logs
# Click on failed run → View logs
```

### Changes Not Appearing

**Solution:**
```bash
# 1. Verify files committed
git status

# 2. Check remote
git log origin/main

# 3. Force push if needed (careful!)
git push -f origin main

# 4. Wait 2 minutes, hard refresh browser
```

## Getting Help

### Quick Checklist

Before asking for help, try:
- [ ] Hard refresh browser (Cmd+Shift+R)
- [ ] Check browser console for errors (F12)
- [ ] Verify running from project root
- [ ] Use correct URL with `/resume/`
- [ ] Run `./scripts/regenerate-data.sh`
- [ ] Check git status and commits

### Useful Commands

```bash
# Check project structure
tree -L 3 -I '.git|.DS_Store'

# Validate JSON
python3 -m json.tool assets/data/config.json
python3 -m json.tool assets/data/config-zh.json

# Test server
python3 -m http.server 8000

# Check git
git status
git log --oneline -5

# View files
ls -la assets/js/
cat assets/js/data-config.js | head -20
```

### Common Error Messages

| Error | Likely Cause | Solution |
|-------|-------------|----------|
| `Unexpected identifier` | Chinese quotes in JSON | Run `regenerate-data.sh` |
| `Cannot set properties of null` | Missing HTML element | Update HTML or check null |
| `404` for assets | Wrong directory | Run from project root |
| `404` for config.json | Expected (uses .js files) | Ignore if data loads |
| `ERR_CONNECTION_CLOSED` | External URL failed | Use local/GitHub avatar |

---

**Still stuck?** Check other documentation:
- `README.md` - Main documentation
- `TESTING_GUIDE.md` - Testing instructions
- `QUICK_REFERENCE.md` - Command reference
