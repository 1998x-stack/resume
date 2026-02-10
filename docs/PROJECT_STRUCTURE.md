# Complete Project Structure

## Overview

This is a bilingual (English/Chinese) resume website with minimalist design, ready for GitHub Pages deployment.

## Directory Tree

```
xieMing/
│
├── 📄 index.html                      # Root redirect to /resume/
│
├── 📁 resume/                         # English version (main)
│   ├── index.html                    # English resume page
│   └── 📁 zh/                        # Chinese version
│       └── index.html                # Chinese resume page
│
├── 📁 .github/                        # GitHub Actions
│   └── workflows/
│       └── deploy.yml                # Auto-deployment workflow
│
├── 🎨 Styles
│   ├── style-minimal.css             # NEW: Minimalist classic design
│   └── style.css                     # OLD: Original colorful design
│
├── 📊 Data Files (JavaScript - No CORS)
│   ├── data-config.js                # English personal data
│   ├── data-config-zh.js             # Chinese personal data
│   └── data-repos.js                 # GitHub projects (shared)
│
├── 📊 Source Config (JSON)
│   ├── config.json                   # English config source
│   ├── config-zh.json                # Chinese config source
│   └── repos.json                    # Projects source (183K)
│
├── 💻 Scripts
│   ├── script.js                     # Main JavaScript logic
│   ├── test-local.sh                 # Test locally (interactive)
│   ├── preview.sh                    # Quick preview
│   └── update-repos.sh               # Update GitHub repos
│
├── 📚 Documentation
│   ├── SETUP.md                      # ⭐ MAIN GUIDE - Read this first!
│   ├── README.md                     # Complete documentation
│   ├── DEPLOY.md                     # Deployment instructions
│   ├── QUICKSTART.md                 # Quick start guide
│   ├── START_HERE.md                 # Quick overview
│   ├── CHANGES.md                    # Changes from docx
│   └── PROJECT_STRUCTURE.md          # This file
│
├── 🗂️ Reference
│   ├── custom-projects-template.json # Template for custom projects
│   ├── index-old.html                # Backup of original index
│   └── .gitignore                    # Git ignore rules
│
└── 📝 Original Resume
    └── 简历-同济-复旦-谢明（Bruce Xie）.docx

```

## File Purposes

### Core HTML Files

| File | Purpose | Language |
|------|---------|----------|
| `index.html` | Root redirect | - |
| `resume/index.html` | Main English resume | EN |
| `resume/zh/index.html` | Chinese resume | ZH |

### Data Layer

| File | Type | Purpose |
|------|------|---------|
| `data-config.js` | JS | English data (no CORS) |
| `data-config-zh.js` | JS | Chinese data (no CORS) |
| `data-repos.js` | JS | Projects (no CORS) |
| `config.json` | JSON | English source |
| `config-zh.json` | JSON | Chinese source |
| `repos.json` | JSON | Projects source |

### Styling

| File | Status | Description |
|------|--------|-------------|
| `style-minimal.css` | ✅ **Active** | Minimalist classic design (经典极简) |
| `style.css` | ⚠️ Legacy | Original colorful design |

### Scripts

| File | Purpose |
|------|---------|
| `script.js` | Main resume logic |
| `test-local.sh` | Interactive testing |
| `preview.sh` | Quick preview server |
| `update-repos.sh` | Refresh GitHub repos |

### Deployment

| File | Purpose |
|------|---------|
| `.github/workflows/deploy.yml` | GitHub Actions auto-deployment |
| `.gitignore` | Git exclusions |

### Documentation

| File | Read When |
|------|-----------|
| `SETUP.md` | **Start here** - Complete setup guide |
| `README.md` | Full reference documentation |
| `DEPLOY.md` | Ready to deploy |
| `QUICKSTART.md` | Need quick steps |
| `START_HERE.md` | First overview |
| `CHANGES.md` | Compare with docx |
| `PROJECT_STRUCTURE.md` | Understanding files |

## URL Mapping

### After Deployment

| URL | Maps To | Language |
|-----|---------|----------|
| `/` | Redirects to `/resume/` | - |
| `/resume/` | `resume/index.html` | EN |
| `/resume/zh/` | `resume/zh/index.html` | ZH |

### Full URLs (Production)

```
https://1998x-stack.github.io/          → English (via redirect)
https://1998x-stack.github.io/resume/   → English
https://1998x-stack.github.io/resume/zh/→ Chinese
```

## Data Flow

```
┌─────────────────────────────────────────────────────────┐
│                    User Opens Page                      │
└────────────────────────┬────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│              HTML loads CSS and Scripts                 │
│  1. style-minimal.css   (minimalist design)            │
│  2. data-config.js      (personal info)                │
│  3. data-repos.js       (GitHub projects)              │
│  4. script.js           (rendering logic)              │
└────────────────────────┬────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│           script.js checks window objects               │
│  - If window.resumeConfig exists → Use it              │
│  - If window.resumeRepos exists → Use it               │
│  - Fallback: Try fetch (for server mode)              │
└────────────────────────┬────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│                  Render Resume                          │
│  1. Personal info (header)                             │
│  2. Skills (grid)                                      │
│  3. Experience (timeline)                              │
│  4. Projects (filterable grid)                         │
│  5. Education (timeline)                               │
└─────────────────────────────────────────────────────────┘
```

## Key Features

### ✅ Fixed Issues

1. **CORS Problem** → Solved with JavaScript data files
2. **Single Language** → Now bilingual EN/ZH
3. **Complex Design** → Applied minimalist classic style
4. **Manual Deploy** → GitHub Actions automation

### ✅ Implemented Features

- **Bilingual**: English (default) and Chinese versions
- **Language Switcher**: Toggle between EN/ZH
- **Theme Toggle**: Light/Dark mode
- **Responsive**: Mobile, tablet, desktop
- **Minimalist Design**: Clean, professional, readable
- **Project Filtering**: Category, search, fork/archive filters
- **Auto-Deploy**: GitHub Actions workflow
- **Print-Ready**: Optimized for printing
- **SEO**: Meta tags and semantic HTML

## Technology Stack

| Layer | Technology |
|-------|-----------|
| **HTML** | Semantic HTML5 |
| **CSS** | Custom CSS3, CSS Variables |
| **JavaScript** | Vanilla ES6+ |
| **Fonts** | System fonts, Georgia serif |
| **Icons** | Font Awesome 6.4 |
| **Deployment** | GitHub Pages + Actions |
| **Version Control** | Git |

## File Sizes

```
style-minimal.css    12K    Minimalist design
script.js            15K    Resume logic  
data-config.js       7K     English data
data-config-zh.js    7K     Chinese data
data-repos.js        ~50K   Projects (minimal)
repos.json           183K   Full projects data
```

## Quick Commands

```bash
# Test locally
./test-local.sh

# Update projects
./update-repos.sh

# Deploy
git add .
git commit -m "Update resume"
git push

# Preview with server
python3 -m http.server 8000
```

## Design Philosophy

### Minimalist Classic (经典极简)

- **清晰布局** - Clear, logical structure
- **空间感强** - Strong spatial hierarchy
- **可读性** - Maximum readability (1.8 line-height)
- **专业干练** - Professional and concise

### Color Palette

**Light:**
- Background: #ffffff
- Text: #2c3e50
- Accent: #3498db

**Dark:**
- Background: #1a1a1a
- Text: #e8e8e8
- Accent: #5dade2

## Next Steps

1. **Test Locally**: `./test-local.sh`
2. **Review Content**: Check both EN and ZH versions
3. **Deploy**: Follow SETUP.md or DEPLOY.md
4. **Share**: Add link to LinkedIn, GitHub profile

## Support Files

All documentation files contain:
- Step-by-step instructions
- Troubleshooting tips
- Examples and screenshots
- Best practices

Start with **SETUP.md** for the complete guide!

---

**Your bilingual minimalist resume is ready for the world! 🚀**
