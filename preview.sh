#!/bin/bash

# Preview GitHub Pages Resume Locally
# This script starts a local web server to preview your resume

PORT=8000

echo "🚀 Starting local web server..."
echo "📄 Your resume will be available at: http://localhost:$PORT"
echo "🛑 Press Ctrl+C to stop the server"
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT
elif command -v python &> /dev/null; then
    python -m http.server $PORT
else
    echo "❌ Error: Python is not installed"
    echo "Please install Python or open index.html directly in your browser"
    exit 1
fi
