# Quick Start Guide

## Step 1: Update Your Personal Information

Open [config.json](config.json) and update it with your information from your docx resume:

1. **Personal Section**:
   - Replace name, title, email
   - Update GitHub, LinkedIn URLs
   - Add a short bio

2. **Skills Section**:
   - List your programming languages
   - Add frameworks and tools you know
   - Specify your expertise areas

3. **Experience Section**:
   - Add your work history
   - Include quantifiable achievements
   - Use action verbs and metrics

4. **Education Section**:
   - Add your degree information
   - Include honors and awards

## Step 2: Review Your Projects

Your GitHub repositories are already loaded in [repos.json](repos.json).

To highlight specific projects, add their names to `featuredProjects` in [config.json](config.json):

```json
"featuredProjects": [
  "your-best-project",
  "another-great-project"
]
```

## Step 3: Preview Locally

Open [index.html](index.html) in your browser:

```bash
# macOS
open index.html

# Linux
xdg-open index.html

# Windows
start index.html
```

Or use a simple HTTP server:

```bash
# Python 3
python3 -m http.server 8000

# Then open http://localhost:8000
```

## Step 4: Deploy to GitHub Pages

### Option 1: User Site (Recommended)

1. Create a repository named `YOUR_USERNAME.github.io`
2. Push all files:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_USERNAME.github.io.git
   git push -u origin main
   ```
3. Visit `https://YOUR_USERNAME.github.io`

### Option 2: Project Site

1. Create any repository (e.g., `resume`)
2. Push files to the repository
3. Go to Settings → Pages
4. Select main branch, root folder
5. Visit `https://YOUR_USERNAME.github.io/resume`

## Step 5: Keep It Updated

Update your repositories anytime:

```bash
./update-repos.sh
```

Then commit and push:

```bash
git add repos.json
git commit -m "Update repositories"
git push
```

## Tips

- ✅ Use a professional profile picture
- ✅ Write clear project descriptions on GitHub
- ✅ Add topics to your GitHub repos for better categorization
- ✅ Quantify achievements in your experience section
- ✅ Keep your resume updated regularly
- ✅ Test on mobile devices

## Customization

### Change Colors

Edit `style.css`, look for `:root` and `[data-theme="dark"]`:

```css
:root {
  --accent-primary: #0066cc;  /* Your brand color */
}
```

### Add Custom Projects

If you have projects not on GitHub, edit `repos.json` and append them to the array. Use [custom-projects-template.json](custom-projects-template.json) as a reference.

### Change Layout

Edit [index.html](index.html) to modify the structure.

## Need Help?

- Check [README.md](README.md) for detailed documentation
- View browser console (F12) for errors
- Validate JSON files at https://jsonlint.com/

---

**You're all set!** 🎉 Good luck with your job search!
