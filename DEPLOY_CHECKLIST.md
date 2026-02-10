# Deployment Checklist

## ✅ Pre-Deployment Checklist

### 1. Test Locally

- [ ] Open `resume/index.html` directly in browser
- [ ] Check English version displays correctly
- [ ] Open `resume/zh/index.html`
- [ ] Check Chinese version displays correctly
- [ ] Test language switcher (EN ↔ ZH)
- [ ] Test theme toggle (Light ↔ Dark)
- [ ] Verify all sections load (Skills, Experience, Projects, Education)
- [ ] Test project filtering and search
- [ ] Check on mobile device or responsive mode

### 2. Review Content

- [ ] Personal information is accurate
- [ ] Email, GitHub, phone numbers are correct
- [ ] Work experience achievements are up to date
- [ ] Education information is complete
- [ ] Featured projects are highlighted
- [ ] Skills list is current

### 3. File Structure

- [ ] All files are in correct directories
- [ ] `assets/` contains css, js, data
- [ ] `resume/` contains EN and ZH HTML
- [ ] `docs/` contains documentation
- [ ] `scripts/` contains utilities
- [ ] Root has `index.html` and `README.md`

## 🚀 Deployment Steps

### Step 1: Create GitHub Repository

- [ ] Go to https://github.com/new
- [ ] Repository name: **`resume`** (exactly this)
- [ ] Make it **Public**
- [ ] Do NOT initialize with README (we have one)
- [ ] Click "Create repository"

### Step 2: Initialize Git (if not already done)

```bash
cd /Users/mx/Desktop/xieMing

# Check if git is initialized
git status

# If not, initialize
git init
```

### Step 3: Add and Commit Files

```bash
# Add all files
git add .

# Check what will be committed
git status

# Commit with descriptive message
git commit -m "Initial commit: Bilingual resume with minimalist design

- English and Chinese versions
- Minimalist classic design (经典极简)
- RAG expertise showcased (73% hallucination reduction)
- Organized file structure (assets/, docs/, scripts/)
- GitHub Actions auto-deployment
- Dark/Light theme toggle
- 100+ GitHub projects with filtering"
```

### Step 4: Push to GitHub

```bash
# Set main branch
git branch -M main

# Add remote (CORRECT URL)
git remote add origin https://github.com/1998x-stack/resume.git

# Push to GitHub
git push -u origin main

# If you get an error about existing remote:
# git remote set-url origin https://github.com/1998x-stack/resume.git
# git push -u origin main
```

### Step 5: Configure GitHub Pages

- [ ] Go to: https://github.com/1998x-stack/resume
- [ ] Click **Settings** (top menu)
- [ ] Click **Pages** (left sidebar)
- [ ] Under "Build and deployment":
  - [ ] Source: Select **"GitHub Actions"** (NOT "Deploy from a branch")
- [ ] Save (automatic)

### Step 6: Wait for Deployment

- [ ] Go to **Actions** tab
- [ ] Watch the workflow run (takes 1-2 minutes)
- [ ] Wait for green checkmark ✓

### Step 7: Verify Live Site

- [ ] Visit: https://1998x-stack.github.io/resume/
- [ ] Check English version works
- [ ] Visit: https://1998x-stack.github.io/resume/zh/
- [ ] Check Chinese version works
- [ ] Test language switcher
- [ ] Test theme toggle
- [ ] Check on mobile device

## 📱 Post-Deployment Tasks

### Update Links

- [ ] Add resume link to GitHub profile bio
- [ ] Add to LinkedIn profile (website section)
- [ ] Add to email signature
- [ ] Update business cards (if applicable)

### Social Media

- [ ] Share on LinkedIn
- [ ] Add to Twitter/X bio
- [ ] Add to professional networks

### Maintenance

- [ ] Set reminder to update monthly
- [ ] Add calendar reminder for quarterly review
- [ ] Bookmark repository for easy access

## 🔄 Future Updates

### Update Personal Info

```bash
# 1. Edit configs
nano assets/data/config.json
nano assets/data/config-zh.json

# 2. Regenerate JS files
echo "window.resumeConfig = $(cat assets/data/config.json);" > assets/js/data-config.js
echo "window.resumeConfig = $(cat assets/data/config-zh.json);" > assets/js/data-config-zh.js

# 3. Commit and push
git add assets/
git commit -m "Update personal information"
git push
```

### Update Projects

```bash
# 1. Run update script
./scripts/update-repos.sh

# 2. Commit and push
git add assets/
git commit -m "Update GitHub projects"
git push
```

### Update Content

```bash
# After any changes
git add .
git commit -m "Describe your changes"
git push

# Site updates automatically in 1-2 minutes!
```

## ⚠️ Troubleshooting

### Issue: GitHub Pages not working

**Check**:
- [ ] Repository is public
- [ ] GitHub Pages source is "GitHub Actions"
- [ ] Workflow completed successfully (Actions tab)
- [ ] Wait 5 minutes and try again
- [ ] Clear browser cache (Cmd+Shift+R)

### Issue: 404 error

**Check**:
- [ ] URL is correct: `/resume/` (not `/`)
- [ ] Files are in correct structure
- [ ] `index.html` exists in root and `resume/`

### Issue: Data not showing

**Check**:
- [ ] Assets are in `assets/` directories
- [ ] HTML files reference correct paths
- [ ] JavaScript files are loading (check browser console F12)

### Issue: Can't push to GitHub

**Solutions**:
```bash
# If remote already exists
git remote set-url origin https://github.com/1998x-stack/resume.git

# If authentication fails
# Use GitHub Personal Access Token or SSH key

# If branch name conflicts
git branch -M main
```

## 📞 Getting Help

### Quick Fixes

1. **Clear browser cache**: Cmd+Shift+R (Mac) or Ctrl+Shift+F5 (Windows)
2. **Check console**: F12 → Console tab (see errors)
3. **Validate JSON**: Use https://jsonlint.com/
4. **Check Actions**: GitHub repo → Actions tab

### Resources

- **README.md**: Main documentation
- **docs/SETUP.md**: Complete setup guide
- **docs/DEPLOY.md**: Detailed deployment guide
- **REORGANIZATION.md**: File structure explained

### Repository Links

- **Repo**: https://github.com/1998x-stack/resume
- **Actions**: https://github.com/1998x-stack/resume/actions
- **Settings**: https://github.com/1998x-stack/resume/settings
- **Pages**: https://github.com/1998x-stack/resume/settings/pages

## ✨ Success Criteria

Your deployment is successful when:

- [x] Repository created at `1998x-stack/resume`
- [x] All files pushed to GitHub
- [x] GitHub Actions workflow runs successfully
- [x] English site loads at `https://1998x-stack.github.io/resume/`
- [x] Chinese site loads at `https://1998x-stack.github.io/resume/zh/`
- [x] Language switcher works
- [x] Theme toggle works
- [x] Projects load and filter correctly
- [x] Mobile responsive

## 🎊 You're Done!

Once all checks pass, your professional bilingual resume is live on the web!

**Share your resume**:
- English: `https://1998x-stack.github.io/resume/`
- Chinese: `https://1998x-stack.github.io/resume/zh/`

---

**Good luck with your job search!** 🚀
