# Resume Website - Updates Based on Your DOCX

## Summary of Changes

The resume website has been updated with your actual information from `简历-同济-复旦-谢明（Bruce Xie）.docx`.

## Updated Information

### Personal Information
- **Name**: 谢明 (Bruce Xie)
- **Title**: AI Agent Algorithm Engineer | RAG & LLM Specialist
- **Location**: Shanghai, China (上海市徐汇区)
- **Email**: xieminghack@163.com
- **Phone**: +86-15801727976
- **GitHub**: https://github.com/1998x-stack

### Professional Summary
Highlights your expertise in:
- RAG systems (73% hallucination reduction)
- LLM applications (37% accuracy improvement)
- Reinforcement learning
- Master's from Fudan University

### Skills Updated
- **Languages**: Python, C++, Java, SQL, JavaScript, Shell
- **Frameworks**: PyTorch, TensorFlow, LangChain, LlamaIndex, Ray, FastAPI, Django, React
- **Tools**: Git, Docker, Kubernetes, Milvus, Elasticsearch, Redis, AWS, Linux
- **Areas**: LLM, RAG, ML/DL, RL, CV, NLP, Distributed Systems

### Work Experience
#### 智慧树 (Zhihuishu) - AI Agent Algorithm Engineer (2023.07 - 2025.12)
- RAG System: Reduced hallucinations by 73%, improved Hit@5 by 37%
- Knowledge Base: 27% MRR improvement, 131ms P95 latency
- Generation Optimization: Prompt templates, self-consistency verification
- Hybrid Retrieval: Milvus + BM25 with BGE re-ranking

#### 美团 (Meituan) - Algorithm Strategy Engineer (2023.01 - 2023.07)
- End-to-End Intelligence: 13% UV_CTR increase, 0.08% DAU growth
- Term Service Optimization: 2.07% UV_CTR increase, 0.07% DAU growth

### Internship Experience (New Section)
#### IDEA - Intelligent Optimization Algorithm Engineer (2022.09 - 2022.12)
- Automated road design using computational geometry algorithms

#### Shanghai Jump Network - RL Research Assistant (2022.01 - 2022.06)
- PPO distributed architecture for MOBA games
- Reduced training time from 13h to 2h (85% reduction)

### Education
#### 复旦大学 (Fudan University) - Master's (2020.09 - 2023.01)
- Major: Computer Science
- Courses: Deep Learning, RL, CV, Pattern Recognition, etc.

#### 同济大学 (Tongji University) - Bachelor's (2015.09 - 2019.06)
- Major: Civil Engineering (Bridge Engineering)
- Courses: Linear Algebra, Data Structures, Probability Theory, etc.

#### 临川二中 (Linchuan No.2 High School) - (2012.09 - 2015.06)
- Honors:
  - Top 600+ in Jiangxi Province Gaokao
  - First Prize - Jiangxi Provincial Mathematics Competition

### Project Categories
Added specialized categories for filtering:
- AI/ML
- NLP/LLM
- Computer Vision
- Reinforcement Learning
- Algorithms
- Web Development
- Data Science
- Tools & Utilities

### Featured Projects
Highlighted key repositories:
- deep_learning
- python_projects
- algorithms
- COMP90024-Cluster-and-Cloud-Computing-Assignment-2
- reinforcement_learning

## Technical Improvements

### New Features
1. **Internships Section**: Added separate section for internship experience
2. **Enhanced Education Display**: Now shows courses and location
3. **Better Metadata**: Added timeline metadata for all positions
4. **Quantified Achievements**: All metrics and improvements are highlighted

### File Changes
- ✅ `config.json` - Completely updated with your resume data
- ✅ `index.html` - Added internships section
- ✅ `script.js` - Added renderInternships() function
- ✅ `preview.sh` - New script for local testing

## Next Steps

### 1. Preview Your Website
```bash
./preview.sh
# Visit http://localhost:8000
```

Or open `index.html` directly in your browser.

### 2. Review and Adjust
- Check if all information is accurate
- Update LinkedIn URL in config.json if you have one
- Adjust featured projects if needed
- Customize colors in style.css if desired

### 3. Deploy to GitHub Pages

#### Option A: User Site (Recommended)
```bash
# Create repository: 1998x-stack.github.io
git init
git add .
git commit -m "Add AI Agent Engineer resume with RAG expertise"
git branch -M main
git remote add origin https://github.com/1998x-stack/1998x-stack.github.io.git
git push -u origin main
```
Visit: https://1998x-stack.github.io

#### Option B: Project Site
```bash
# Create any repository (e.g., resume)
git init
git add .
git commit -m "Add AI Agent Engineer resume"
git branch -M main
git remote add origin https://github.com/1998x-stack/resume.git
git push -u origin main
```
Then enable GitHub Pages in repository settings.

### 4. Keep Updated
```bash
# Update repositories
./update-repos.sh

# Update personal info
# Edit config.json

# Deploy changes
git add .
git commit -m "Update resume"
git push
```

## Tips for Maximum Impact

### Highlight Your RAG Expertise
Your RAG system achievements are impressive:
- 73% hallucination reduction
- 37% accuracy improvement
- 27% MRR improvement

Make sure potential employers see these metrics!

### Project Portfolio
Your repos.json contains 100+ projects. Consider:
1. Featuring your best AI/ML projects
2. Adding detailed README files to featured repos
3. Using GitHub Topics for better categorization

### LinkedIn Integration
Update your LinkedIn URL in config.json and ensure your LinkedIn profile mirrors these achievements.

### SEO Optimization
The page title and meta description highlight your RAG and LLM expertise, which is great for recruiters searching for these skills.

## Questions or Issues?

- **JSON Validation**: Use https://jsonlint.com/ to check config.json
- **Browser Console**: Press F12 to see any errors
- **Local Testing**: Always test locally before deploying

---

**Your resume is ready to deploy!** 🎉

Your expertise in RAG systems, LLM applications, and reinforcement learning is now beautifully showcased in a modern, interactive format.
