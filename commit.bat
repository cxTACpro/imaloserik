@echo off
echo Committing and pushing to GitHub...

git add -u
git add -A

git diff --cached --quiet
if %errorlevel% equ 0 (
    echo No changes to commit
) else (
    git commit -m "Update changed files on %date% %time%"
    git push origin main
    echo Pushed to GitHub successfully!
)
