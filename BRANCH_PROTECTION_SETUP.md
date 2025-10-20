# Branch Protection Rules Setup Guide

This document provides instructions for configuring branch protection rules for the AIDe repository to ensure all changes go through Pull Requests and only the repository owner can approve/merge them.

## Required Configuration

To meet the requirements:
- **All changes must be on a PR** (no direct commits to main/protected branches)
- **Only you (agileandy) can approve/merge PRs**

## Step-by-Step Setup Instructions

### 1. Access Repository Settings

1. Navigate to your repository: `https://github.com/agileandy/AIDe`
2. Click on **Settings** tab (you need admin access)
3. In the left sidebar, click on **Branches** under "Code and automation"

### 2. Add Branch Protection Rule

Click **Add rule** or **Add branch protection rule** button.

### 3. Configure the Branch Protection Rule

Configure the following settings:

#### Branch Name Pattern
- Enter: `main` (or your default branch name)
- This protects your main branch from direct commits

#### Protection Settings

**Required - Enable these:**

1. ✅ **Require a pull request before merging**
   - This ensures all changes must go through a PR
   - Under this option, also enable:
     - ✅ **Require approvals** (set to at least 1)
     - ✅ **Dismiss stale pull request approvals when new commits are pushed**
     - ⚠️ **Require review from Code Owners** (This works with the CODEOWNERS file)

2. ✅ **Require status checks to pass before merging** (optional but recommended)
   - You can add specific status checks here if you have CI/CD workflows

3. ✅ **Require conversation resolution before merging** (recommended)
   - Ensures all PR comments are resolved before merging

4. ✅ **Do not allow bypassing the above settings**
   - This is CRITICAL - ensures even admins must follow the rules
   - However, you might want to keep this unchecked initially so you have an override option in emergencies

5. ✅ **Restrict who can push to matching branches** (IMPORTANT)
   - Enable this setting
   - Do NOT add anyone to the list (or add only yourself if needed)
   - This prevents direct pushes to the main branch

6. ✅ **Allow force pushes** - ❌ Keep this DISABLED
   - Prevents force pushes that could overwrite history

7. ✅ **Allow deletions** - ❌ Keep this DISABLED
   - Prevents accidental branch deletion

#### Additional Recommended Settings

- ✅ **Require linear history** (optional) - Prevents merge commits, requires rebase/squash
- ✅ **Require deployments to succeed before merging** (if you have deployment workflows)
- ✅ **Lock branch** (optional) - Makes branch read-only

### 4. Save Changes

Click **Create** or **Save changes** at the bottom of the page.

## CODEOWNERS File

This repository includes a `.github/CODEOWNERS` file that specifies `@agileandy` as the owner of all files. When combined with the "Require review from Code Owners" setting, this ensures:

- All PRs require your review and approval
- No one else can approve and merge PRs

## Verification

After setting up:

1. Try to push directly to main:
   ```bash
   git checkout main
   git commit --allow-empty -m "Test commit"
   git push
   ```
   This should be **rejected** with an error about branch protection.

2. Create a test PR:
   - Create a new branch
   - Make a change
   - Push the branch
   - Create a PR
   - Verify that the PR requires your approval before it can be merged

## Additional Security Measures

Consider enabling these in your repository settings:

### General Settings
- Under Settings → General → Pull Requests:
  - ✅ **Allow squash merging** (recommended)
  - ❌ Disable **Allow merge commits** (to keep history clean)
  - ❌ Disable **Allow rebase merging** (unless you prefer this)
  - ✅ **Always suggest updating pull request branches**
  - ✅ **Automatically delete head branches** (cleans up after merge)

### Branch Protection for Other Branches
Consider protecting other important branches (like `develop`, `staging`) with similar rules.

## Troubleshooting

### Issue: I'm locked out and can't push or merge
**Solution:** Temporarily disable branch protection, make your change, then re-enable it. OR grant yourself bypass permissions.

### Issue: CODEOWNERS not working
**Solution:** Ensure:
1. The CODEOWNERS file is in `.github/CODEOWNERS`
2. The GitHub username is correct (`@agileandy`)
3. "Require review from Code Owners" is enabled in branch protection settings
4. You've committed and pushed the CODEOWNERS file

## References

- [GitHub Docs: Branch Protection Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [GitHub Docs: Code Owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [GitHub Docs: Pull Request Reviews](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews)

---

**Note:** These settings require admin access to the repository. The protection rules are configured through the GitHub web interface, not through code in the repository itself.
