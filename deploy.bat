@echo off
echo ========================================
echo    Resume Builder Website Deployment
echo ========================================
echo.

echo Checking files...
if not exist "hero.html" (
    echo ERROR: hero.html not found!
    pause
    exit /b 1
)

if not exist "hero.css" (
    echo ERROR: hero.css not found!
    pause
    exit /b 1
)

echo ✓ All files found!

echo.
echo Choose deployment method:
echo 1. GitHub Pages (Recommended)
echo 2. Netlify (Drag & Drop)
echo 3. Vercel (Fast)
echo 4. Just create ZIP file
echo.

set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto github
if "%choice%"=="2" goto netlify
if "%choice%"=="3" goto vercel
if "%choice%"=="4" goto zip
goto invalid

:github
echo.
echo === GitHub Pages Deployment ===
echo 1. Create a new repository on GitHub
echo 2. Copy your repository URL
echo 3. Run these commands:
echo.
echo git init
echo git add .
echo git commit -m "Initial commit"
echo git branch -M main
echo git remote add origin YOUR_REPO_URL_HERE
echo git push -u origin main
echo.
echo 4. Go to Settings → Pages → Deploy from main branch
echo 5. Your site will be live at: https://YOUR_USERNAME.github.io/YOUR_REPO_NAME
echo.
goto end

:netlify
echo.
echo === Netlify Deployment ===
echo 1. Go to https://netlify.com
echo 2. Sign up with GitHub
echo 3. Drag your project folder to the deploy area
echo 4. Your site goes live instantly!
echo.
goto end

:vercel
echo.
echo === Vercel Deployment ===
echo 1. Go to https://vercel.com
echo 2. Sign up with GitHub
echo 3. Import your repository
echo 4. Deploy automatically
echo.
goto end

:zip
echo.
echo === Creating ZIP file ===
powershell -command "Compress-Archive -Path 'hero.html','hero.css','*.png' -DestinationPath 'resume-builder-website.zip'"
echo ✓ ZIP file created: resume-builder-website.zip
echo You can upload this to any hosting service!
echo.
goto end

:invalid
echo Invalid choice! Please run the script again.
echo.

:end
echo.
echo 🚀 Happy Deploying!
echo.
pause
