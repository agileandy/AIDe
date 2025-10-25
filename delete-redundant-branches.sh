#!/bin/bash

# Script to delete redundant branches from the AIDe repository
# Run this script with appropriate GitHub credentials configured

set -e

echo "================================================"
echo "AIDe Repository - Branch Cleanup Script"
echo "================================================"
echo ""

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

echo "This script will delete the following ${#BRANCHES[@]} redundant branches:"
for branch in "${BRANCHES[@]}"; do
  echo "  - $branch"
done
echo ""

# Confirmation prompt
read -p "Are you sure you want to delete these branches? (yes/no): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
  echo "Aborted. No branches were deleted."
  exit 0
fi

echo ""
echo "Starting branch deletion..."
echo ""

# Counter for successful deletions
SUCCESS_COUNT=0
FAILED_COUNT=0

# Delete each branch
for branch in "${BRANCHES[@]}"; do
  echo -n "Deleting branch: $branch ... "
  if git push origin --delete "$branch" 2>/dev/null; then
    echo "✓ SUCCESS"
    SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
  else
    echo "✗ FAILED (may not exist or insufficient permissions)"
    FAILED_COUNT=$((FAILED_COUNT + 1))
  fi
done

echo ""
echo "================================================"
echo "Branch Deletion Summary"
echo "================================================"
echo "Successfully deleted: $SUCCESS_COUNT branches"
echo "Failed to delete: $FAILED_COUNT branches"
echo ""

# Prune local references
echo "Cleaning up local references..."
git fetch --prune
echo "✓ Local references pruned"
echo ""

# Show remaining branches
echo "================================================"
echo "Remaining Remote Branches"
echo "================================================"
git branch -r | grep -v 'HEAD'
echo ""

echo "Branch cleanup complete!"
