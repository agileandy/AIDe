# Branch Cleanup Documentation

## Overview
This document identifies all redundant branches in the repository that can be safely deleted.

## Analysis Date
2025-10-22

## Current Branch Status

### Protected Branches (KEEP)
- `main` - Primary protected branch

### Active Branches (KEEP)
- `copilot/remove-redundant-branches` - Current working branch for cleanup task

### Redundant Branches (DELETE)

The following branches have been merged or closed and are no longer needed:

#### Merged Branches
1. **`local-changes`**
   - Merged via PR #1 on 2025-10-19
   - Purpose: Merge of simple framework
   - Status: Safe to delete

2. **`fix-gitignore-and-remove-idea`**
   - Merged via PR #3 on 2025-10-20
   - Purpose: Remove idea.md and add to .gitignore
   - Status: Safe to delete

3. **`copilot/remove-ds-store-file`**
   - Merged via PR #4 on 2025-10-20
   - Purpose: Remove .DS_Store file from repository
   - Status: Safe to delete

4. **`copilot/set-up-pr-protection-rules`**
   - Merged via PR #5 on 2025-10-22
   - Purpose: Add branch protection documentation and CODEOWNERS
   - Status: Safe to delete

5. **`feat/spec-launch-and-cascade`**
   - Merged via PR #6 on 2025-10-22 and PR #10 on 2025-10-22
   - Purpose: Launch script and cascading rulebook / orchestration improvements
   - Status: Safe to delete

6. **`agileandy-patch-1`**
   - Merged via PR #7 on 2025-10-22
   - Purpose: Delete BRANCH_PROTECTION_SETUP.md
   - Status: Safe to delete

7. **`agileandy-patch-2`**
   - Merged via PR #8 on 2025-10-22
   - Purpose: Delete README.md
   - Status: Safe to delete

8. **`agileandy-patch-3`**
   - Merged via PR #9 on 2025-10-22
   - Purpose: Delete QUICK_START.md
   - Status: Safe to delete

#### Closed Branches (Not Merged)
9. **`feature/add-seed-prompt-spec`**
   - Closed via PR #2 on 2025-10-20 (not merged)
   - Purpose: Add seed prompt specification and idea documentation
   - Status: Safe to delete (changes not incorporated)

10. **`copilot/remove-agent-base-from-repo`**
    - Closed via PR #11 on 2025-10-22 (not merged)
    - Purpose: Remove agent_base from repository and history
    - Status: Safe to delete

#### Duplicate/Orphaned Branches
11. **`add-seed-prompt-spec`**
    - Appears to be a duplicate or alternative to `feature/add-seed-prompt-spec`
    - No associated PR found
    - Status: Safe to delete

## How to Delete These Branches

### Option 1: Using GitHub Web Interface
1. Navigate to: https://github.com/agileandy/AIDe/branches
2. Find each branch listed above under "Redundant Branches"
3. Click the delete icon (trash can) next to each branch
4. Confirm the deletion

### Option 2: Using Git Command Line
Run the following commands to delete all redundant branches:

```bash
# Delete remote branches
git push origin --delete local-changes
git push origin --delete fix-gitignore-and-remove-idea
git push origin --delete copilot/remove-ds-store-file
git push origin --delete copilot/set-up-pr-protection-rules
git push origin --delete feat/spec-launch-and-cascade
git push origin --delete agileandy-patch-1
git push origin --delete agileandy-patch-2
git push origin --delete agileandy-patch-3
git push origin --delete feature/add-seed-prompt-spec
git push origin --delete copilot/remove-agent-base-from-repo
git push origin --delete add-seed-prompt-spec

# Optionally, clean up local tracking branches
git fetch --prune
```

### Option 3: Batch Delete Script
Create a script file `cleanup-branches.sh`:

```bash
#!/bin/bash

# List of branches to delete
BRANCHES=(
  "local-changes"
  "fix-gitignore-and-remove-idea"
  "copilot/remove-ds-store-file"
  "copilot/set-up-pr-protection-rules"
  "feat/spec-launch-and-cascade"
  "agileandy-patch-1"
  "agileandy-patch-2"
  "agileandy-patch-3"
  "feature/add-seed-prompt-spec"
  "copilot/remove-agent-base-from-repo"
  "add-seed-prompt-spec"
)

echo "Deleting redundant branches..."
for branch in "${BRANCHES[@]}"; do
  echo "Deleting branch: $branch"
  git push origin --delete "$branch" 2>/dev/null && echo "✓ Deleted $branch" || echo "✗ Failed to delete $branch (may not exist)"
done

echo "Pruning local references..."
git fetch --prune

echo "Branch cleanup complete!"
```

Make it executable and run:
```bash
chmod +x cleanup-branches.sh
./cleanup-branches.sh
```

## Verification

After deletion, verify that only the following branches remain:
- `main`
- Any new feature branches currently being worked on

Run this command to list all remote branches:
```bash
git branch -r
```

Expected output should only show:
```
origin/main
origin/HEAD -> origin/main
```

## Notes

- **Important**: Do not delete the `main` branch or any active feature branches
- After this cleanup, consider establishing a branch cleanup policy:
  - Delete merged branches automatically after PR merge
  - Set up branch protection rules
  - Regularly audit branches (monthly/quarterly)

## References
- All pull requests: https://github.com/agileandy/AIDe/pulls?q=is%3Apr
- Repository branches: https://github.com/agileandy/AIDe/branches
