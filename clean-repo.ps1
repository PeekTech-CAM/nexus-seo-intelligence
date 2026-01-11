# Nexus SEO Intelligence - Clean Repository Setup Script
# This will create a fresh, secure repository without any secrets

Write-Host "🎯 Nexus SEO Intelligence - Clean Repository Setup" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Backup current code
Write-Host "📦 Step 1: Creating backup of your code..." -ForegroundColor Yellow
cd ..
if (Test-Path "nexus-seo-backup") {
    Write-Host "⚠️  Backup folder already exists. Removing old backup..." -ForegroundColor Yellow
    Remove-Item -Path "nexus-seo-backup" -Recurse -Force
}

Copy-Item -Path "nexus-seo-intelligence" -Destination "nexus-seo-backup" -Recurse
Write-Host "✅ Backup created at: nexus-seo-backup" -ForegroundColor Green
Write-Host ""

# Step 2: Clean the backup
Write-Host "🧹 Step 2: Cleaning sensitive files from backup..." -ForegroundColor Yellow
cd nexus-seo-backup

# Remove Git history
if (Test-Path ".git") {
    Remove-Item -Path ".git" -Recurse -Force
    Write-Host "✅ Removed old Git history" -ForegroundColor Green
}

# Remove all environment files
Get-ChildItem -Filter ".env*" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Filter "*.backup" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Write-Host "✅ Removed all .env and backup files" -ForegroundColor Green
Write-Host ""

# Step 3: Create proper .gitignore
Write-Host "📝 Step 3: Creating secure .gitignore..." -ForegroundColor Yellow
$gitignoreContent = @"
# Python
__pycache__/
*.py[cod]
*.so
.Python
venv/
env/
.venv/
*.log

# Environment files - NEVER COMMIT!
.env
.env.*
*.env
.env.backup
.env.local
.env.production
.env.development
*.backup
*.bak

# Streamlit secrets
.streamlit/secrets.toml
secrets.toml

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Database
*.db
*.sqlite
"@

$gitignoreContent | Out-File -FilePath .gitignore -Encoding utf8
Write-Host "✅ Created .gitignore with security rules" -ForegroundColor Green
Write-Host ""

# Step 4: Initialize Git
Write-Host "🔧 Step 4: Initializing fresh Git repository..." -ForegroundColor Yellow
git init
Write-Host "✅ Git repository initialized" -ForegroundColor Green
Write-Host ""

# Step 5: Configure Git
Write-Host "⚙️ Step 5: Configuring Git..." -ForegroundColor Yellow
$username = Read-Host "Enter your GitHub username (default: PeekTech-CAM)"
if ([string]::IsNullOrWhiteSpace($username)) {
    $username = "PeekTech-CAM"
}

$email = Read-Host "Enter your GitHub email"
if ([string]::IsNullOrWhiteSpace($email)) {
    Write-Host "❌ Email is required!" -ForegroundColor Red
    exit 1
}

git config user.name "$username"
git config user.email "$email"
Write-Host "✅ Git configured with username: $username" -ForegroundColor Green
Write-Host ""

# Step 6: Verify no secrets
Write-Host "🔍 Step 6: Verifying no sensitive files exist..." -ForegroundColor Yellow
$envFiles = Get-ChildItem -Filter ".env*" -Recurse -ErrorAction SilentlyContinue
$backupFiles = Get-ChildItem -Filter "*.backup" -Recurse -ErrorAction SilentlyContinue

if ($envFiles.Count -gt 0 -or $backupFiles.Count -gt 0) {
    Write-Host "⚠️  WARNING: Found sensitive files:" -ForegroundColor Red
    $envFiles | ForEach-Object { Write-Host "  - $($_.FullName)" -ForegroundColor Red }
    $backupFiles | ForEach-Object { Write-Host "  - $($_.FullName)" -ForegroundColor Red }
    Write-Host ""
    $continue = Read-Host "Remove these files? (y/n)"
    if ($continue -eq "y") {
        $envFiles | Remove-Item -Force
        $backupFiles | Remove-Item -Force
        Write-Host "✅ Removed sensitive files" -ForegroundColor Green
    } else {
        Write-Host "❌ Cannot proceed with sensitive files present!" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "✅ No sensitive files found - safe to proceed!" -ForegroundColor Green
}
Write-Host ""

# Step 7: Create initial commit
Write-Host "💾 Step 7: Creating initial commit..." -ForegroundColor Yellow
git add .
git commit -m "Initial commit - Nexus SEO Intelligence Platform (clean and secure)"
Write-Host "✅ Initial commit created" -ForegroundColor Green
Write-Host ""

# Step 8: Setup remote
Write-Host "🔗 Step 8: Setting up GitHub remote..." -ForegroundColor Yellow
$repoName = Read-Host "Enter repository name (default: nexus-seo-intelligence)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "nexus-seo-intelligence"
}

$repoUrl = "https://github.com/$username/$repoName.git"
git branch -M main
git remote add origin $repoUrl
Write-Host "✅ Remote added: $repoUrl" -ForegroundColor Green
Write-Host ""

# Step 9: Final instructions
Write-Host "⚠️  IMPORTANT: Before pushing to GitHub!" -ForegroundColor Red
Write-Host "============================================" -ForegroundColor Red
Write-Host ""
Write-Host "1. 🔐 ROTATE YOUR API KEYS:" -ForegroundColor Yellow
Write-Host "   - Stripe: https://dashboard.stripe.com/test/apikeys" -ForegroundColor White
Write-Host "   - Supabase: https://app.supabase.com/project/_/settings/api" -ForegroundColor White
Write-Host ""
Write-Host "2. 📝 Update .streamlit/secrets.toml with NEW keys:" -ForegroundColor Yellow
Write-Host "   SUPABASE_URL = 'your-new-url'" -ForegroundColor White
Write-Host "   SUPABASE_KEY = 'your-new-key'" -ForegroundColor White
Write-Host "   STRIPE_SECRET_KEY = 'sk_test_NEW_KEY'" -ForegroundColor White
Write-Host ""
Write-Host "3. 🗑️  Delete old repository on GitHub:" -ForegroundColor Yellow
Write-Host "   https://github.com/$username/$repoName/settings" -ForegroundColor White
Write-Host "   Scroll to 'Danger Zone' → Delete repository" -ForegroundColor White
Write-Host ""
Write-Host "4. ➕ Create NEW repository on GitHub:" -ForegroundColor Yellow
Write-Host "   https://github.com/new" -ForegroundColor White
Write-Host "   Name: $repoName" -ForegroundColor White
Write-Host "   DON'T initialize with README" -ForegroundColor White
Write-Host ""
Write-Host "5. 🚀 After completing steps 1-4, run:" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "✅ Setup complete! Ready to push once you've rotated keys." -ForegroundColor Green