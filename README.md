# Bruce Xie (谢明) - Resume Website

[![Deploy](https://github.com/1998x-stack/resume/actions/workflows/deploy.yml/badge.svg)](https://github.com/1998x-stack/resume/actions/workflows/deploy.yml)

A modern, bilingual (English/Chinese) resume website with minimalist design. Features dynamic project loading from GitHub, responsive layout, and dark/light themes.

## 🌐 Live Demo

- **English**: https://1998x-stack.github.io/resume/
- **中文**: https://1998x-stack.github.io/resume/zh/

## ✨ Features

- **Bilingual Support**: English and Chinese versions with easy language switching
- **Minimalist Design**: Clean, professional, content-focused layout (经典极简)
- **Dark/Light Themes**: Toggle between themes with persistent storage
- **Dynamic Projects**: Automatically loads 100+ GitHub repositories
- **Advanced Filtering**: Filter by category, search, stars, forks, and archived status
- **Responsive Design**: Works perfectly on mobile, tablet, and desktop
- **Auto-Deployment**: GitHub Actions workflow for automatic deployment
- **SEO Optimized**: Proper meta tags and semantic HTML
- **Print-Ready**: Optimized styles for printing

## 📁 Project Structure

```
resume/
├── index.html                    # Root redirect page
├── resume/
│   ├── index.html               # English resume
│   └── zh/
│       └── index.html           # Chinese resume (中文简历)
│
├── assets/
│   ├── css/
│   │   └── style.css            # Minimalist design stylesheet
│   ├── js/
│   │   ├── script.js            # Main resume logic
│   │   ├── data-config.js       # English personal data
│   │   ├── data-config-zh.js    # Chinese personal data
│   │   └── data-repos.js        # GitHub projects data
│   └── data/
│       ├── config.json          # English source config
│       ├── config-zh.json       # Chinese source config
│       └── repos.json           # Full projects data
│
├── scripts/
│   ├── update-repos.sh          # Update GitHub repositories
│   ├── preview.sh               # Local preview server
│   └── test-local.sh            # Interactive testing
│
├── docs/
│   ├── SETUP.md                 # Complete setup guide
│   ├── DEPLOY.md                # Deployment instructions
│   └── ...                      # Other documentation
│
└── .github/
    └── workflows/
        └── deploy.yml           # GitHub Actions deployment
```

## 🚀 Quick Start

### Option 1: Direct File Opening (Fastest)

The website works directly in your browser without a server:

```bash
# Navigate to project directory
cd /Users/mx/Desktop/xieMing

# Open English version
open resume/index.html

# Open Chinese version
open resume/zh/index.html
```

### Option 2: Local Server (Recommended - Tests Full Structure)

```bash
# Clone the repository (if you don't have it)
git clone https://github.com/1998x-stack/resume.git
cd resume

# IMPORTANT: Run server from PROJECT ROOT
python3 -m http.server 8000

# Then visit these URLs:
# English: http://localhost:8000/resume/
# Chinese: http://localhost:8000/resume/zh/
# (Note: Must include /resume/ in URL!)
```

**⚠️ Common Mistake**: Don't run the server from inside `resume/` directory - always from project root!

### Option 3: Interactive Testing (Best for Beginners)

```bash
cd /Users/mx/Desktop/xieMing
./scripts/test-local.sh
```

This script checks everything and guides you through testing.

## 📝 Customization

### Update Personal Information

Edit the config files:

```bash
# English
nano assets/data/config.json

# Chinese
nano assets/data/config-zh.json

# Regenerate JavaScript data files
echo "window.resumeConfig = $(cat assets/data/config.json);" > assets/js/data-config.js
echo "window.resumeConfig = $(cat assets/data/config-zh.json);" > assets/js/data-config-zh.js
```

### Update Projects

```bash
./scripts/update-repos.sh
```

### Customize Colors

Edit `assets/css/style.css`:

```css
:root {
    --accent: #3498db;  /* Change to your brand color */
}
```

## 🎨 Design Philosophy

This resume follows the **Minimalist Classic** (经典极简) design principles:

- **Clear Layout**: 900px max-width, centered content
- **Strong Spacing**: Consistent spatial hierarchy
- **High Readability**: 1.8 line-height, serif headings
- **Professional**: Content-first, minimal decoration
- **Accessible**: WCAG compliant, keyboard navigable

### Color Palette

**Light Theme:**
- Background: `#ffffff`
- Text: `#2c3e50`
- Accent: `#3498db`

**Dark Theme:**
- Background: `#1a1a1a`
- Text: `#e8e8e8`
- Accent: `#5dade2`

## 🛠️ Technology Stack

- **HTML5**: Semantic markup
- **CSS3**: Custom properties, Flexbox, Grid
- **JavaScript**: Vanilla ES6+
- **Icons**: Font Awesome 6.4
- **Deployment**: GitHub Pages + Actions
- **CI/CD**: Automated with GitHub Actions

## 📦 Deployment

### Deploy to GitHub Pages

1. **Fork or Clone** this repository

2. **Push to GitHub**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Bilingual resume"
   git branch -M main
   git remote add origin https://github.com/1998x-stack/resume.git
   git push -u origin main
   ```

3. **Enable GitHub Pages**:
   - Go to repository **Settings** → **Pages**
   - Source: Select **GitHub Actions**
   - Wait 1-2 minutes for deployment

4. **Visit your resume**:
   - English: `https://1998x-stack.github.io/resume/`
   - Chinese: `https://1998x-stack.github.io/resume/zh/`

## 🔄 Updating Your Resume

### Update Personal Info

```bash
# Edit configs
nano assets/data/config.json
nano assets/data/config-zh.json

# Regenerate JS files
./scripts/update-configs.sh  # (create this helper script)

# Commit and push
git add assets/
git commit -m "Update personal information"
git push
```

### Update Projects

```bash
# Fetch latest repos
./scripts/update-repos.sh

# Commit and push
git add assets/
git commit -m "Update GitHub projects"
git push
```

Changes go live in 1-2 minutes after pushing!

## 📊 Key Achievements Showcased

- **73% Hallucination Reduction** in RAG systems
- **37% Accuracy Improvement** (Hit@5)
- **27% MRR Improvement** in retrieval
- **85% Training Time Reduction** (RL optimization)
- **13% UV_CTR Increase** at Meituan

## 🎯 Professional Experience

- **Zhihuishu** - AI Agent Algorithm Engineer (2023.07-2025.12)
- **Meituan** - Algorithm Strategy Engineer (2023.01-2023.07)
- **IDEA** - Intelligent Optimization Algorithm Engineer (2022.09-2022.12)
- **Shanghai Jump Network** - RL Research Assistant (2022.01-2022.06)

## 🎓 Education

- **Fudan University** - Master's in Computer Science (2020-2023)
- **Tongji University** - Bachelor's in Civil Engineering (2015-2019)

## 💻 Tech Stack

**Languages**: Python, C++, Java, SQL, JavaScript, Shell
**Frameworks**: PyTorch, TensorFlow, LangChain, LlamaIndex, Ray, FastAPI
**Tools**: Git, Docker, Kubernetes, Milvus, Elasticsearch, Redis, AWS

## 📄 License

Feel free to use this template for your own resume. Attribution appreciated but not required.

## 🤝 Contributing

Suggestions and improvements are welcome! Please open an issue or submit a pull request.

## 📧 Contact

- **GitHub**: [@1998x-stack](https://github.com/1998x-stack)
- **Email**: xieminghack@163.com
- **Website**: https://1998x-stack.github.io/resume/

---

**Built with ❤️ using vanilla JavaScript and modern CSS**

If you found this useful, please ⭐ star the repository!
