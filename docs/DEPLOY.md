# Deployment Guide for 1998x-stack

## Quick Deploy to GitHub Pages

Follow these steps to get your resume live at `https://1998x-stack.github.io`

### Step 1: Test Locally (Recommended)

```bash
# Navigate to the directory
cd /Users/mx/Desktop/xieMing

# Start local server
./preview.sh

# Open http://localhost:8000 in your browser
# Check that everything looks good
```

### Step 2: Create GitHub Repository

You have two options:

#### Option A: User Site (Recommended) ⭐

This will make your resume available at: `https://1998x-stack.github.io`

```bash
# 1. Go to GitHub.com and create a new repository named:
#    1998x-stack.github.io
#    (Must match your username exactly!)

# 2. Initialize git in your project
cd /Users/mx/Desktop/xieMing
git init

# 3. Add all files
git add .

# 4. Create first commit
git commit -m "Initial commit: AI Agent Engineer resume

- RAG system expertise (73% hallucination reduction)
- LLM applications (37% accuracy improvement)
- Fudan University Computer Science Master's
- Experience at Zhihuishu and Meituan
- 100+ GitHub projects showcased"

# 5. Set main branch
git branch -M main

# 6. Add remote (replace with your actual repo URL)
git remote add origin https://github.com/1998x-stack/1998x-stack.github.io.git

# 7. Push to GitHub
git push -u origin main
```

**Result**: Your resume will be live at `https://1998x-stack.github.io` within 1-2 minutes!

#### Option B: Project Site

This will make your resume available at: `https://1998x-stack.github.io/resume`

```bash
# 1. Go to GitHub.com and create a new repository named: resume

# 2-6. Same steps as Option A, but use different remote:
git remote add origin https://github.com/1998x-stack/resume.git
git push -u origin main

# 7. Enable GitHub Pages:
#    - Go to repository Settings → Pages
#    - Under "Source", select: Deploy from a branch
#    - Select: main branch, / (root) folder
#    - Click Save
```

**Result**: Your resume will be live at `https://1998x-stack.github.io/resume`

### Step 3: Verify Deployment

1. Wait 1-2 minutes for GitHub Pages to build
2. Visit your URL
3. Test on both desktop and mobile
4. Check dark/light mode toggle
5. Test project filtering

### Step 4: Share Your Resume

Add the link to:
- ✅ Your GitHub profile README
- ✅ LinkedIn profile
- ✅ Email signature
- ✅ Job applications
- ✅ Twitter/social media

## Updating Your Resume

### Update Personal Info

```bash
# Edit config.json
nano config.json
# or use any text editor

# Commit and push
git add config.json
git commit -m "Update personal information"
git push
```

### Update Projects

```bash
# Fetch latest repos
./update-repos.sh

# Review changes
git diff repos.json

# Commit and push
git add repos.json
git commit -m "Update GitHub repositories"
git push
```

### Update Experience

```bash
# Edit config.json
nano config.json

# Commit and push
git add config.json
git commit -m "Add new work experience"
git push
```

Changes will be live in 1-2 minutes after pushing!

## Customization Tips

### Change Theme Colors

Edit `style.css` around line 3:

```css
:root {
    --accent-primary: #0066cc;  /* Your brand color */
    --accent-secondary: #0052a3;
}
```

### Add Custom Domain (Optional)

If you own a domain (e.g., `brucexie.com`):

1. Create a file named `CNAME` in your project root:
   ```bash
   echo "brucexie.com" > CNAME
   ```

2. Configure DNS with your domain provider:
   - Add A records pointing to GitHub's IPs
   - Or add CNAME record pointing to `1998x-stack.github.io`

3. Push changes:
   ```bash
   git add CNAME
   git commit -m "Add custom domain"
   git push
   ```

4. In GitHub repository settings → Pages, enter your custom domain

### Highlight Specific Projects

Edit `config.json` and update `featuredProjects` array:

```json
"featuredProjects": [
    "your-best-project",
    "impressive-rag-demo",
    "llm-application"
]
```

## Troubleshooting

### Issue: Page not loading after deployment

**Solution**:
- Check GitHub repository → Actions tab for build status
- Verify GitHub Pages is enabled in Settings → Pages
- Wait 5 minutes and clear browser cache

### Issue: Projects not showing

**Solution**:
- Verify `repos.json` exists and is valid JSON
- Check browser console (F12) for errors
- Ensure repos.json is not too large (>5MB)

### Issue: Personal info not displaying

**Solution**:
- Validate config.json at https://jsonlint.com/
- Check for syntax errors (missing commas, quotes)
- Verify all required fields are present

### Issue: Changes not appearing

**Solution**:
```bash
# Force refresh in browser (Cmd+Shift+R or Ctrl+Shift+F5)
# Or wait a few minutes for GitHub Pages cache to clear
```

## Pro Tips

### 1. SEO Optimization
Your page is already optimized with:
- Title: "谢明 (Bruce Xie) - Resume"
- Meta description highlighting RAG and LLM expertise
- Semantic HTML structure

### 2. Analytics (Optional)
Add Google Analytics by inserting tracking code before `</head>` in index.html

### 3. Social Preview
Add Open Graph meta tags for better social media sharing:

```html
<meta property="og:title" content="Bruce Xie - AI Agent Engineer">
<meta property="og:description" content="RAG & LLM Specialist...">
<meta property="og:image" content="https://avatars.githubusercontent.com/u/32125213">
```

### 4. Regular Updates
Set a reminder to:
- Update repos.json monthly: `./update-repos.sh`
- Review and update config.json quarterly
- Keep featured projects current

## Support

If you encounter issues:
1. Check browser console (F12) for errors
2. Validate JSON files at https://jsonlint.com/
3. Review GitHub Pages documentation
4. Check repository Actions tab for build logs

---

**Ready to deploy?** 🚀

Run the commands above and your professional resume will be live within minutes!

Your RAG expertise and impressive metrics (73% hallucination reduction, 37% accuracy improvement) deserve to be showcased. Let's get it online!
