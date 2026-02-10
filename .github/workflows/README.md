# GitHub Actions Workflow Documentation

## Deploy Workflow

This workflow automatically deploys your resume to GitHub Pages whenever you push to the `main` branch.

### Workflow File

Location: `.github/workflows/deploy.yml`

### How It Works

The workflow has two jobs that run sequentially:

#### 1. **Validate Job** (runs first)

Checks that all required files are present and valid before deployment:

- **File Structure Validation**
  - Verifies all critical HTML, CSS, and JS files exist
  - Checks both English and Chinese versions
  - Ensures data files are present

- **JSON Validation**
  - Validates `config.json` syntax
  - Validates `config-zh.json` syntax
  - Validates `repos.json` syntax
  - Prevents deployment of broken JSON files

- **JavaScript Validation**
  - Checks all JS files are not empty
  - Reports file sizes
  - Ensures data files contain content

#### 2. **Deploy Job** (runs after validation passes)

Deploys the resume to GitHub Pages:

- Checks out the repository
- Configures GitHub Pages
- Uploads all files as an artifact
- Deploys to GitHub Pages
- Displays deployment information

### Triggers

The workflow runs when:

1. **Automatic**: Any push to `main` branch
   ```bash
   git push origin main
   ```

2. **Manual**: Click "Run workflow" button in Actions tab
   - Go to: https://github.com/1998x-stack/resume/actions
   - Click "Deploy Resume to GitHub Pages"
   - Click "Run workflow"

### Permissions

The workflow needs these permissions (already configured):

- `contents: read` - Read repository files
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - Authentication for deployment

### Deployment URLs

After successful deployment, your resume will be available at:

- **English**: `https://1998x-stack.github.io/resume/`
- **Chinese**: `https://1998x-stack.github.io/resume/zh/`

### Viewing Workflow Runs

1. Go to your repository on GitHub
2. Click the "Actions" tab
3. Click on a workflow run to see details
4. View logs for each step

### Workflow Status

You can see the workflow status in several places:

- **Repository badge**: Add to README.md
  ```markdown
  [![Deploy](https://github.com/1998x-stack/resume/actions/workflows/deploy.yml/badge.svg)](https://github.com/1998x-stack/resume/actions/workflows/deploy.yml)
  ```

- **Actions tab**: Shows all workflow runs

- **Commits**: Green checkmark (✓) or red X (✗) next to commit

### Troubleshooting

#### Validation Failed

If the **validate** job fails:

1. Check the error message in Actions logs
2. Fix the issue locally
3. Test with:
   ```bash
   ./scripts/test-validation.sh
   ```
4. Commit and push the fix

Common validation errors:

- **Missing files**: File was deleted or moved
  - Solution: Restore the file or update paths

- **Invalid JSON**: Syntax error in config files
  - Solution: Validate with `python3 -m json.tool file.json`
  - Or run: `./scripts/regenerate-data.sh`

- **Empty JS files**: Data file not generated
  - Solution: Run `./scripts/regenerate-data.sh`

#### Deployment Failed

If the **deploy** job fails but validation passed:

1. Check GitHub Pages settings:
   - Go to Settings → Pages
   - Source must be: "GitHub Actions"

2. Check permissions:
   - Workflow has correct permissions (already set)
   - Repository is public (or has Pages enabled)

3. Check Actions logs for specific error

4. Try manual re-run:
   - Go to failed workflow run
   - Click "Re-run all jobs"

### Workflow Configuration

#### Concurrency

```yaml
concurrency:
  group: "pages"
  cancel-in-progress: false
```

This ensures:
- Only one deployment runs at a time
- Deployments are not cancelled mid-process
- Queued deployments wait for current one to finish

#### Validation Timeout

Default timeout: 6 hours (rarely needed)

To set custom timeout:
```yaml
jobs:
  validate:
    timeout-minutes: 5  # Validation should be quick
```

### Testing Locally

Before pushing, test validation locally:

```bash
# Test file structure
./scripts/test-validation.sh

# Test JSON validity
python3 -m json.tool assets/data/config.json
python3 -m json.tool assets/data/config-zh.json

# Test JS files exist and are not empty
ls -lh assets/js/*.js

# Test full site
python3 -m http.server 8000
# Visit http://localhost:8000/resume/
```

### Deployment Timeline

Typical deployment process:

1. **Push to GitHub**: Instant
2. **Workflow starts**: ~10-30 seconds
3. **Validation job**: ~30-60 seconds
4. **Deploy job**: ~30-60 seconds
5. **Pages live**: +1-2 minutes

**Total time**: ~2-4 minutes from push to live

### Best Practices

1. **Always test locally** before pushing
   ```bash
   python3 -m http.server 8000
   ```

2. **Check validation** before committing
   ```bash
   ./scripts/test-validation.sh
   ./scripts/regenerate-data.sh
   ```

3. **Use meaningful commit messages**
   ```bash
   git commit -m "Update work experience and skills"
   ```

4. **Monitor the first deployment**
   - Watch Actions tab
   - Check for any errors
   - Visit live site to verify

5. **Keep data files in sync**
   - Edit JSON files
   - Run regenerate script
   - Commit both JSON and JS files

### Customizing the Workflow

#### Add Custom Validation

Edit `.github/workflows/deploy.yml`:

```yaml
- name: Custom validation
  run: |
    echo "Running custom checks..."
    # Add your validation here
```

#### Add Notifications

Add Slack/Discord notifications:

```yaml
- name: Notify on success
  if: success()
  run: |
    # Send notification
    curl -X POST webhook_url -d "Deployment successful"
```

### Useful GitHub Actions Links

- **Actions documentation**: https://docs.github.com/en/actions
- **GitHub Pages actions**: https://github.com/actions/deploy-pages
- **Workflow syntax**: https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions

### FAQ

**Q: How do I disable automatic deployment?**

A: Remove the `push` trigger from deploy.yml, keep only `workflow_dispatch` for manual runs.

**Q: Can I deploy from a different branch?**

A: Yes, change `branches: - main` to your branch name in deploy.yml.

**Q: How do I see what was deployed?**

A: Check the "Upload artifact" step in Actions logs, or visit the live site.

**Q: Can I rollback a deployment?**

A: Yes, revert the commit and push:
```bash
git revert HEAD
git push
```

**Q: Why is validation important?**

A: It prevents deploying broken sites and catches errors before they go live.

---

**Need help?** Check the TROUBLESHOOTING.md file or open an issue on GitHub.
