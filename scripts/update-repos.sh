#!/bin/bash

# Update GitHub Repositories Script
# This script fetches your latest GitHub repositories and updates repos.json

GITHUB_USERNAME="1998x-stack"
OUTPUT_FILE="assets/data/repos.json"
JS_OUTPUT="assets/js/data-repos.js"

echo "🔄 Fetching repositories for user: $GITHUB_USERNAME"

# Fetch repos from GitHub API
curl -s "https://api.github.com/users/$GITHUB_USERNAME/repos?per_page=100&sort=updated" -o "$OUTPUT_FILE"

# Check if the request was successful
if [ $? -eq 0 ]; then
    echo "✅ Successfully updated $OUTPUT_FILE"

    # Count repos
    REPO_COUNT=$(grep -o '"name":' "$OUTPUT_FILE" | wc -l | tr -d ' ')
    echo "📊 Total repositories: $REPO_COUNT"

    # Generate JavaScript data file
    echo "🔄 Generating JavaScript data file..."
    cat "$OUTPUT_FILE" | python3 -c "
import json, sys
repos = json.load(sys.stdin)
minimal = [{
    'name': r['name'],
    'html_url': r['html_url'],
    'description': r.get('description'),
    'fork': r['fork'],
    'stargazers_count': r['stargazers_count'],
    'forks_count': r['forks_count'],
    'language': r.get('language'),
    'topics': r.get('topics', []),
    'updated_at': r['updated_at'],
    'archived': r.get('archived', False),
    'open_issues_count': r.get('open_issues_count', 0)
} for r in repos]
print('window.resumeRepos = ' + json.dumps(minimal, ensure_ascii=False) + ';')
" > "$JS_OUTPUT"

    echo "✅ Generated $JS_OUTPUT"

    # Check if we hit the limit
    if [ "$REPO_COUNT" -eq 100 ]; then
        echo "⚠️  Warning: You have 100+ repositories. This script only fetches the first 100."
    fi
else
    echo "❌ Failed to fetch repositories"
    exit 1
fi

echo ""
echo "💡 Next steps:"
echo "   1. Review: git diff $OUTPUT_FILE"
echo "   2. Commit: git add assets/ && git commit -m 'Update repositories'"
echo "   3. Push: git push"
