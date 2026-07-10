@echo off
echo "📝 Committing changed files..."

git add -u
git add -A
if git diff --cached --quiet; then
    echo "ℹ️ No changes to commit"
else
    git commit -m "Update changed files on $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "✅ Updated successfully!"