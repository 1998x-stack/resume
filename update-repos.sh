#!/bin/bash

# Update GitHub Repositories Script
# This script fetches your latest GitHub repositories and updates repos.json

GITHUB_USERNAME="1998x-stack"
OUTPUT_FILE="repos.json"

echo "🔄 Fetching repositories for user: $GITHUB_USERNAME"

# Fetch repos from GitHub API
curl -s "https://api.github.com/users/$GITHUB_USERNAME/repos?per_page=100&sort=updated" -o "$OUTPUT_FILE"

# Check if the request was successful
if [ $? -eq 0 ]; then
    echo "✅ Successfully updated $OUTPUT_FILE"

    # Count repos
    REPO_COUNT=$(grep -o '"name":' "$OUTPUT_FILE" | wc -l | tr -d ' ')
    echo "📊 Total repositories: $REPO_COUNT"

    # Check if we hit the limit
    if [ "$REPO_COUNT" -eq 100 ]; then
        echo "⚠️  Warning: You have 100+ repositories. This script only fetches the first 100."
        echo "   Consider using pagination to fetch all repos."
    fi
else
    echo "❌ Failed to fetch repositories"
    exit 1
fi

echo ""
echo "💡 Next steps:"
echo "   1. Review changes: git diff $OUTPUT_FILE"
echo "   2. Commit changes: git add $OUTPUT_FILE && git commit -m 'Update repositories'"
echo "   3. Push to GitHub: git push"
