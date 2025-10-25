# Quick Action: Remove Redundant Branches

## TL;DR

Run this command to delete 11 old redundant branches:

```bash
./delete-redundant-branches.sh
```

Or delete them via GitHub UI: https://github.com/agileandy/AIDe/branches

---

## What This Does

Removes 11 branches that have already been merged or closed:
- ✓ 8 merged branches from completed PRs
- ✓ 2 closed/unmerged branches
- ✓ 1 orphaned duplicate branch

## Before You Run

Make sure you have:
- [x] Reviewed BRANCH_CLEANUP.md for full details
- [x] Confirmed all branches listed are truly redundant
- [x] Admin access to delete branches

## After Deletion

Verify only active branches remain:
```bash
git fetch --prune
git branch -r
```

Expected to see only:
- `origin/main`
- Any new active feature branches

---

**Full documentation**: See [BRANCH_CLEANUP.md](BRANCH_CLEANUP.md)
