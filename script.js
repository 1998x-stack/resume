// ==================== Global State ====================
let config = null;
let repos = [];
let filteredRepos = [];

// Language colors (GitHub style)
const languageColors = {
    'JavaScript': '#f1e05a',
    'Python': '#3572A5',
    'Java': '#b07219',
    'C++': '#f34b7d',
    'C': '#555555',
    'TypeScript': '#2b7489',
    'Go': '#00ADD8',
    'Rust': '#dea584',
    'Ruby': '#701516',
    'PHP': '#4F5D95',
    'Swift': '#ffac45',
    'Kotlin': '#F18E33',
    'HTML': '#e34c26',
    'CSS': '#563d7c',
    'Shell': '#89e051',
    'Jupyter Notebook': '#DA5B0B',
    'TeX': '#3D6117'
};

// ==================== Initialize ====================
document.addEventListener('DOMContentLoaded', async () => {
    initTheme();
    await loadConfig();
    await loadRepos();
    renderPersonalInfo();
    renderSkills();
    renderExperience();
    renderInternships();
    renderEducation();
    renderProjects();
    initEventListeners();
    updateFooter();
});

// ==================== Theme Management ====================
function initTheme() {
    const savedTheme = localStorage.getItem('theme') || 'light';
    document.documentElement.setAttribute('data-theme', savedTheme);
    updateThemeIcon(savedTheme);
}

function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
    updateThemeIcon(newTheme);
}

function updateThemeIcon(theme) {
    const icon = document.querySelector('#theme-toggle i');
    icon.className = theme === 'dark' ? 'fas fa-sun' : 'fas fa-moon';
}

// ==================== Data Loading ====================
async function loadConfig() {
    try {
        const response = await fetch('config.json');
        config = await response.json();
    } catch (error) {
        console.error('Error loading config:', error);
        // Use default config
        config = getDefaultConfig();
    }
}

async function loadRepos() {
    try {
        const response = await fetch('repos.json');
        repos = await response.json();
        filteredRepos = [...repos];
    } catch (error) {
        console.error('Error loading repos:', error);
        repos = [];
        filteredRepos = [];
    }
}

function getDefaultConfig() {
    return {
        personal: {
            name: "Your Name",
            title: "Software Engineer",
            avatar: "https://via.placeholder.com/150",
            location: "Location",
            bio: "Your bio here",
            email: "email@example.com",
            github: "https://github.com/username",
            linkedin: "https://linkedin.com/in/username",
            website: "https://yourwebsite.com"
        },
        skills: {
            languages: [],
            frameworks: [],
            tools: [],
            areas: []
        },
        experience: [],
        education: [],
        featuredProjects: [],
        projectFilters: {
            excludeForks: false,
            minStars: 0
        }
    };
}

// ==================== Rendering Functions ====================
function renderPersonalInfo() {
    const { personal } = config;

    document.getElementById('avatar').src = personal.avatar;
    document.getElementById('name').textContent = personal.name;
    document.getElementById('footer-name').textContent = personal.name;
    document.getElementById('title').textContent = personal.title;
    document.getElementById('bio').textContent = personal.bio;

    document.getElementById('github-link').href = personal.github;
    document.getElementById('email-link').href = `mailto:${personal.email}`;
    document.getElementById('linkedin-link').href = personal.linkedin;
    document.getElementById('location').querySelector('span').textContent = personal.location;

    // Update page title
    document.title = `${personal.name} - Resume`;
}

function renderSkills() {
    const { skills } = config;

    renderSkillCategory('languages', skills.languages);
    renderSkillCategory('frameworks', skills.frameworks);
    renderSkillCategory('tools', skills.tools);
    renderSkillCategory('areas', skills.areas);
}

function renderSkillCategory(categoryId, items) {
    const container = document.getElementById(categoryId);
    container.innerHTML = items.map(skill =>
        `<span class="skill-tag">${skill}</span>`
    ).join('');
}

function renderExperience() {
    const container = document.getElementById('experience-list');
    const { experience } = config;

    if (!experience || experience.length === 0) {
        container.innerHTML = '<p style="color: var(--text-secondary);">No experience data available. Update config.json to add your work experience.</p>';
        return;
    }

    container.innerHTML = experience.map(exp => `
        <div class="timeline-item">
            <div class="timeline-header">
                <h3>${exp.position} @ ${exp.company}</h3>
                <div class="timeline-meta">
                    <span><i class="fas fa-calendar"></i>${exp.duration}</span>
                    <span><i class="fas fa-map-marker-alt"></i>${exp.location}</span>
                </div>
            </div>
            <div class="timeline-content">
                <ul>
                    ${exp.achievements.map(achievement => `<li>${achievement}</li>`).join('')}
                </ul>
            </div>
        </div>
    `).join('');
}

function renderInternships() {
    const container = document.getElementById('internships-list');
    const { internships } = config;

    if (!internships || internships.length === 0) {
        // Hide the section if no internships
        const section = document.getElementById('internships-section');
        if (section) section.style.display = 'none';
        return;
    }

    container.innerHTML = internships.map(intern => `
        <div class="timeline-item">
            <div class="timeline-header">
                <h3>${intern.position} @ ${intern.company}</h3>
                <div class="timeline-meta">
                    <span><i class="fas fa-calendar"></i>${intern.duration}</span>
                    <span><i class="fas fa-map-marker-alt"></i>${intern.location}</span>
                </div>
            </div>
            <div class="timeline-content">
                <ul>
                    ${intern.achievements.map(achievement => `<li>${achievement}</li>`).join('')}
                </ul>
            </div>
        </div>
    `).join('');
}

function renderEducation() {
    const container = document.getElementById('education-list');
    const { education } = config;

    if (!education || education.length === 0) {
        container.innerHTML = '<p style="color: var(--text-secondary);">No education data available. Update config.json to add your education background.</p>';
        return;
    }

    container.innerHTML = education.map(edu => `
        <div class="timeline-item">
            <div class="timeline-header">
                <h3>${edu.school}</h3>
                <div class="timeline-meta">
                    <span><i class="fas fa-graduation-cap"></i>${edu.degree} - ${edu.major}</span>
                    <span><i class="fas fa-calendar"></i>${edu.duration}</span>
                    ${edu.location ? `<span><i class="fas fa-map-marker-alt"></i>${edu.location}</span>` : ''}
                </div>
            </div>
            ${edu.courses && edu.courses.length > 0 ? `
                <div class="timeline-content">
                    <p style="color: var(--text-secondary); margin-bottom: var(--spacing-xs);"><strong>Key Courses:</strong> ${edu.courses.join(', ')}</p>
                </div>
            ` : ''}
            ${edu.honors && edu.honors.length > 0 ? `
                <div class="timeline-honors">
                    ${edu.honors.map(honor => `<span class="honor-badge">${honor}</span>`).join('')}
                </div>
            ` : ''}
        </div>
    `).join('');
}

function renderProjects() {
    const container = document.getElementById('projects-grid');

    if (filteredRepos.length === 0) {
        container.innerHTML = '<div class="loading"><i class="fas fa-info-circle"></i><p>No projects found</p></div>';
        return;
    }

    // Sort repos: featured first, then by stars, then by updated date
    const featured = config.featuredProjects || [];
    const sortedRepos = [...filteredRepos].sort((a, b) => {
        const aFeatured = featured.includes(a.name);
        const bFeatured = featured.includes(b.name);

        if (aFeatured && !bFeatured) return -1;
        if (!aFeatured && bFeatured) return 1;

        if (b.stargazers_count !== a.stargazers_count) {
            return b.stargazers_count - a.stargazers_count;
        }

        return new Date(b.updated_at) - new Date(a.updated_at);
    });

    container.innerHTML = sortedRepos.map(repo => createProjectCard(repo)).join('');
    updateProjectStats();
}

function createProjectCard(repo) {
    const isFeatured = (config.featuredProjects || []).includes(repo.name);
    const language = repo.language;
    const languageColor = languageColors[language] || '#ccc';

    return `
        <div class="project-card ${isFeatured ? 'featured' : ''}" data-repo="${repo.name}">
            <div class="project-header">
                <a href="${repo.html_url}" target="_blank" rel="noopener" class="project-name">
                    <i class="fas fa-folder"></i>
                    ${repo.name}
                    ${isFeatured ? '<i class="fas fa-star" style="color: gold;"></i>' : ''}
                </a>
                ${repo.fork ? '<span class="fork-badge"><i class="fas fa-code-branch"></i>Fork</span>' : ''}
                ${repo.archived ? '<span class="archive-badge"><i class="fas fa-archive"></i>Archived</span>' : ''}
            </div>

            <p class="project-description">
                ${repo.description || 'No description available'}
            </p>

            <div class="project-stats">
                <span class="stat-item">
                    <i class="fas fa-star"></i>
                    ${repo.stargazers_count}
                </span>
                <span class="stat-item">
                    <i class="fas fa-code-branch"></i>
                    ${repo.forks_count}
                </span>
                ${repo.open_issues_count > 0 ? `
                    <span class="stat-item">
                        <i class="fas fa-exclamation-circle"></i>
                        ${repo.open_issues_count}
                    </span>
                ` : ''}
            </div>

            ${repo.topics && repo.topics.length > 0 ? `
                <div class="project-topics">
                    ${repo.topics.slice(0, 5).map(topic =>
                        `<span class="topic-tag">${topic}</span>`
                    ).join('')}
                </div>
            ` : ''}

            <div class="project-footer">
                ${language ? `
                    <span class="language-badge">
                        <span class="language-dot" style="background-color: ${languageColor}"></span>
                        ${language}
                    </span>
                ` : '<span></span>'}
                <a href="${repo.html_url}" target="_blank" rel="noopener" class="project-link">
                    View <i class="fas fa-external-link-alt"></i>
                </a>
            </div>
        </div>
    `;
}

// ==================== Filtering ====================
function filterProjects() {
    const includeForks = document.getElementById('filter-forks').checked;
    const includeArchived = document.getElementById('filter-archived').checked;
    const category = document.getElementById('category-filter').value;
    const searchTerm = document.getElementById('search-filter').value.toLowerCase();

    filteredRepos = repos.filter(repo => {
        // Fork filter
        if (!includeForks && repo.fork) return false;

        // Archived filter
        if (!includeArchived && repo.archived) return false;

        // Category filter
        if (category !== 'all') {
            const categoryTopics = config.projectFilters?.categories?.[category] || [];
            const hasCategory = repo.topics?.some(topic =>
                categoryTopics.some(cat => topic.toLowerCase().includes(cat.toLowerCase()))
            );
            if (!hasCategory) return false;
        }

        // Search filter
        if (searchTerm) {
            const searchIn = [
                repo.name,
                repo.description || '',
                ...(repo.topics || [])
            ].join(' ').toLowerCase();

            if (!searchIn.includes(searchTerm)) return false;
        }

        return true;
    });

    renderProjects();
}

function updateProjectStats() {
    const count = filteredRepos.length;
    const total = repos.length;
    document.getElementById('project-count').textContent =
        `Showing ${count} of ${total} projects`;
}

function populateCategoryFilter() {
    const select = document.getElementById('category-filter');
    const categories = config.projectFilters?.categories || {};

    select.innerHTML = '<option value="all">All Categories</option>';
    Object.keys(categories).forEach(category => {
        const option = document.createElement('option');
        option.value = category;
        option.textContent = category;
        select.appendChild(option);
    });
}

// ==================== Event Listeners ====================
function initEventListeners() {
    // Theme toggle
    document.getElementById('theme-toggle').addEventListener('click', toggleTheme);

    // Project filters
    document.getElementById('filter-forks').addEventListener('change', filterProjects);
    document.getElementById('filter-archived').addEventListener('change', filterProjects);
    document.getElementById('category-filter').addEventListener('change', filterProjects);
    document.getElementById('search-filter').addEventListener('input', filterProjects);

    // Populate category filter
    populateCategoryFilter();
}

// ==================== Footer Updates ====================
function updateFooter() {
    const currentYear = new Date().getFullYear();
    document.getElementById('current-year').textContent = currentYear;

    const lastUpdated = new Date().toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
    document.getElementById('last-updated').textContent = lastUpdated;
}

// ==================== Helper Functions ====================
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Debounced search
const debouncedSearch = debounce(filterProjects, 300);
document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('search-filter');
    if (searchInput) {
        searchInput.removeEventListener('input', filterProjects);
        searchInput.addEventListener('input', debouncedSearch);
    }
});
