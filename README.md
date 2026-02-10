# GitHub Pages Resume

A modern, interactive resume website built with vanilla HTML, CSS, and JavaScript. Features dynamic project loading from your GitHub repositories and dark/light theme support.

## Features

- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **Dark/Light Mode**: Toggle between themes with persistent storage
- **Dynamic Projects**: Automatically loads your GitHub repositories
- **Project Filtering**: Filter by category, search by keyword, include/exclude forks and archived repos
- **Modern UI**: Clean, professional design with smooth animations
- **Easy Customization**: Simple JSON configuration file
- **GitHub Pages Ready**: Deploy in minutes

## Quick Start

### 1. Update Your Personal Information

Edit `config.json` to add your personal information, skills, experience, and education:

```json
{
  "personal": {
    "name": "Your Name",
    "title": "Your Title",
    "email": "your.email@example.com",
    ...
  },
  "skills": {
    "languages": ["Python", "JavaScript", ...],
    ...
  },
  "experience": [...],
  "education": [...]
}
```

### 2. Update Repository Data

To refresh your GitHub repositories:

```bash
curl -s "https://api.github.com/users/YOUR_USERNAME/repos" -o repos.json
```

Replace `YOUR_USERNAME` with your GitHub username.

### 3. Deploy to GitHub Pages

#### Option A: Using a New Repository

1. Create a new repository named `YOUR_USERNAME.github.io`
2. Push all files to this repository:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: GitHub Pages resume"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_USERNAME.github.io.git
   git push -u origin main
   ```
3. Your resume will be available at `https://YOUR_USERNAME.github.io`

#### Option B: Using GitHub Pages from Any Repository

1. Create a new repository (e.g., `resume`)
2. Push all files to the repository
3. Go to repository Settings → Pages
4. Under "Source", select "Deploy from a branch"
5. Select `main` branch and `/ (root)` folder
6. Click Save
7. Your resume will be available at `https://YOUR_USERNAME.github.io/resume`

## File Structure

```
.
├── index.html          # Main HTML structure
├── style.css           # Styling and themes
├── script.js           # Dynamic functionality
├── config.json         # Your personal information (EDIT THIS)
├── repos.json          # GitHub repositories data (auto-generated)
└── README.md          # This file
```

## Customization Guide

### Personal Information

Edit the `personal` section in `config.json`:

- `name`: Your full name
- `title`: Your professional title
- `avatar`: Link to your profile picture (GitHub avatar by default)
- `bio`: Short description about yourself
- `email`, `github`, `linkedin`, `website`: Contact links

### Skills

Update the `skills` section with your technical abilities:

```json
"skills": {
  "languages": ["Python", "JavaScript", "C++"],
  "frameworks": ["React", "Django", "PyTorch"],
  "tools": ["Git", "Docker", "AWS"],
  "areas": ["Machine Learning", "Web Development"]
}
```

### Work Experience

Add your work history in the `experience` array:

```json
"experience": [
  {
    "company": "Company Name",
    "position": "Your Position",
    "duration": "2020.01 - Present",
    "location": "City, Country",
    "achievements": [
      "Achievement with quantifiable results",
      "Technical impact you made",
      "Leadership or innovation example"
    ]
  }
]
```

### Education

Add your educational background:

```json
"education": [
  {
    "school": "University Name",
    "degree": "Bachelor's/Master's/Ph.D.",
    "major": "Your Major",
    "duration": "2015 - 2019",
    "honors": ["Honor 1", "Honor 2"]
  }
]
```

### Featured Projects

Highlight specific repositories by adding their names to `featuredProjects`:

```json
"featuredProjects": [
  "awesome-project",
  "important-repo",
  "showcase-work"
]
```

### Project Categories

Define categories for filtering projects:

```json
"projectFilters": {
  "categories": {
    "AI/ML": ["machine-learning", "deep-learning", "neural-network"],
    "Web Development": ["web", "frontend", "backend"],
    "Tools": ["tool", "cli", "utility"]
  }
}
```

## Updating Your Resume

### Update Repositories

Run this command to fetch your latest repositories:

```bash
curl -s "https://api.github.com/users/YOUR_USERNAME/repos" -o repos.json
```

### Update Personal Info

Edit `config.json` with your latest information.

### Deploy Changes

```bash
git add .
git commit -m "Update resume"
git push
```

Changes will be live in a few minutes.

## Advanced Customization

### Colors

Edit CSS variables in `style.css` under `:root` and `[data-theme="dark"]` to customize colors:

```css
:root {
  --accent-primary: #0066cc;  /* Change primary color */
  --accent-secondary: #0052a3;
  ...
}
```

### Adding Sections

You can add new sections by:
1. Adding HTML in `index.html`
2. Adding styles in `style.css`
3. Adding data to `config.json`
4. Adding rendering logic in `script.js`

## Tips for Best Results

1. **Keep Projects Updated**: Regularly refresh your `repos.json`
2. **Write Good Descriptions**: Ensure your GitHub repos have clear descriptions
3. **Use Topics**: Add relevant topics to your GitHub repos for better categorization
4. **Quantify Achievements**: Use numbers and metrics in your experience section
5. **Professional Photo**: Use a high-quality, professional profile picture
6. **Regular Updates**: Keep your resume current with your latest work

## Troubleshooting

### Projects Not Loading

- Check that `repos.json` exists and is valid JSON
- Open browser console (F12) to see any errors
- Ensure the file is properly formatted

### Personal Info Not Showing

- Verify `config.json` is valid JSON
- Check for syntax errors (missing commas, quotes, etc.)
- Use a JSON validator: https://jsonlint.com/

### GitHub Pages Not Working

- Ensure repository name is correct for user pages (`USERNAME.github.io`)
- Check that GitHub Pages is enabled in repository settings
- Wait a few minutes after pushing for changes to go live
- Check the Pages build status in repository Actions tab

## Browser Support

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## License

Feel free to use this template for your own resume. Attribution appreciated but not required.

## Credits

Built with:
- Font Awesome for icons
- GitHub API for repository data
- Vanilla JavaScript (no frameworks required!)

---

**Happy job hunting!** 🚀

If you found this useful, consider starring the repository!
