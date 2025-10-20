# Quick Reference: Branch Protection Setup

## 🎯 Goal
Ensure all changes go through PRs and only @agileandy can approve/merge them.

## ✅ What's Already Done (in this PR)
- ✅ CODEOWNERS file created (`.github/CODEOWNERS`)
- ✅ PR template added (`.github/pull_request_template.md`)
- ✅ Comprehensive setup guide created (`BRANCH_PROTECTION_SETUP.md`)
- ✅ README with contributing guidelines

## 🔧 What You Need to Do (GitHub UI)

### Step 1: Go to Settings
Navigate to: `https://github.com/agileandy/AIDe/settings/branches`

### Step 2: Add Branch Protection Rule
1. Click **"Add rule"** or **"Add branch protection rule"**
2. Branch name pattern: `main`

### Step 3: Enable These Settings

**Required Settings:**
- ✅ Require a pull request before merging
  - ✅ Require approvals: **1**
  - ✅ Require review from Code Owners
  - ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ Require conversation resolution before merging
- ✅ Restrict who can push to matching branches
  - **Leave the list EMPTY** or add only yourself
- ❌ Allow force pushes: **DISABLED**
- ❌ Allow deletions: **DISABLED**

**Optional but Recommended:**
- ✅ Require status checks to pass before merging (if you add CI/CD)
- ✅ Require linear history
- ✅ Do not allow bypassing the above settings (locks you out too - be careful!)

### Step 4: Save
Click **"Create"** or **"Save changes"**

## 🧪 Test It Works

After setup, try:
```bash
# This should FAIL:
git checkout main
echo "test" >> test.txt
git add test.txt
git commit -m "test"
git push  # ❌ Should be rejected

# This should WORK:
git checkout -b test-branch
echo "test" >> test.txt
git add test.txt
git commit -m "test"
git push origin test-branch  # ✅ Should work
# Then create PR on GitHub
```

## 📚 More Details
See [BRANCH_PROTECTION_SETUP.md](BRANCH_PROTECTION_SETUP.md) for complete documentation.

## 🆘 Need Help?
- [GitHub Docs: Protected Branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [GitHub Docs: CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
