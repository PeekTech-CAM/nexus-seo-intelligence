# Nexus SEO Intelligence - GitHub Upload Script (Windows)
# Run this with: .\deploy.ps1

Write-Host "🎯 Nexus SEO Intelligence - GitHub Upload Script" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    git --version | Out-Null
    Write-Host "✅ Git is installed" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed. Please install git first." -ForegroundColor Red
    Write-Host "Download from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# Get GitHub username and repository name
$GITHUB_USERNAME = Read-Host "Enter your GitHub username"
$REPO_NAME_INPUT = Read-Host "Enter repository name (press Enter for 'nexus-seo-intelligence')"
$REPO_NAME = if ([string]::IsNullOrWhiteSpace($REPO_NAME_INPUT)) { "nexus-seo-intelligence" } else { $REPO_NAME_INPUT }

Write-Host ""
Write-Host "📋 Configuration:" -ForegroundColor Cyan
Write-Host "   GitHub Username: $GITHUB_USERNAME"
Write-Host "   Repository: $REPO_NAME"
Write-Host "   URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
Write-Host ""

$CONFIRM = Read-Host "Is this correct? (y/n)"
if ($CONFIRM -ne "y") {
    Write-Host "Aborted by user" -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "🔧 Step 1: Creating .gitignore file..." -ForegroundColor Cyan

$gitignoreContent = @"
# Python
__pycache__/
*.py[cod]
*`$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual Environment
env/
venv/
ENV/
env.bak/
venv.bak/
.venv/

# Secrets and Environment Variables
.env
.env.local
.env.*.local
.streamlit/secrets.toml
secrets.toml
*.key
*.pem

# IDE
.idea/
.vscode/
*.swp
*.swo
*~
.DS_Store

# Logs
*.log
logs/

# Database
*.db
*.sqlite
*.sqlite3

# Temporary files
*.tmp
.cache/
.pytest_cache/

# OS
Thumbs.db
desktop.ini
"@

Set-Content -Path ".gitignore" -Value $gitignoreContent
Write-Host "✅ .gitignore created" -ForegroundColor Green

Write-Host ""
Write-Host "📝 Step 2: Creating README.md..." -ForegroundColor Cyan

$readmeContent = @"
# 🎯 Nexus SEO Intelligence

**AI-Powered SEO Analysis Platform with Multi-Agent System**

[![Python](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![Streamlit](https://img.shields.io/badge/Streamlit-1.28+-red.svg)](https://streamlit.io/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 🚀 Features

- 🧠 **Advanced AI Scanner** - Multi-agent AI system for comprehensive SEO analysis
- 📊 **Detailed Reports** - Technical SEO, content strategy, and competitive intelligence
- 💎 **Multiple Plans** - Demo, Pro, Agency, and Elite tiers
- 🔐 **Admin Dashboard** - User management and analytics
- 📈 **Scan History** - Track SEO improvements over time
- 🎨 **Beautiful UI** - Modern, responsive design with gradients and animations

## 🛠️ Tech Stack

- **Frontend**: Streamlit
- **Backend**: Python 3.9+
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **AI Analysis**: Multi-agent system

## 📦 Installation

### Prerequisites

- Python 3.9 or higher
- Git
- Supabase account

### Quick Start

1. **Clone the repository**
``````bash
git clone https://github.com/$GITHUB_USERNAME/$REPO_NAME.git
cd $REPO_NAME
``````

2. **Create virtual environment**
``````bash
python -m venv venv
venv\Scripts\activate  # On Windows
``````

3. **Install dependencies**
``````bash
pip install -r requirements.txt
``````

4. **Set up environment variables**

Create ``.streamlit/secrets.toml``:
``````toml
SUPABASE_URL = "your_supabase_url_here"
SUPABASE_KEY = "your_supabase_anon_key_here"
``````

5. **Run the application**
``````bash
streamlit run app.py
``````

The app will open at ``http://localhost:8501``

## 📁 Project Structure

``````
nexus-seo-intelligence/
├── app.py                      # Main application entry point
├── pages/
│   ├── 3_Advanced_Scanner.py  # AI-powered SEO scanner
│   ├── 3_Scan_Results.py      # Scan history and results
│   └── 4_Billing.py           # Pricing and plans
├── .streamlit/
│   └── secrets.toml           # Environment variables (not in git)
├── requirements.txt           # Python dependencies
├── .gitignore                # Git ignore rules
├── README.md                 # This file
└── LICENSE                   # MIT License
``````

## 💰 Pricing Plans

| Plan | Scans/Month | Credits | Price |
|------|-------------|---------|-------|
| **Demo** | 2 | 0 | Free |
| **Pro** | 50 | 100,000 | €49/month |
| **Agency** | 200 | 500,000 | €149/month |
| **Elite** | Unlimited | 10,000,000 | €399/month |

## 🎮 Demo Mode

Try the platform without signing up:
- Click "Try Demo" on the login page
- Get 2 free scans
- No credit card required

## 🔐 Admin Features

Admin users (configured in ``ADMIN_EMAILS``) can access:
- 👥 User management
- 📊 Platform analytics
- ⚙️ System settings
- 🔄 Plan upgrades

## 🚢 Deployment

### Streamlit Cloud

1. Push to GitHub
2. Go to [share.streamlit.io](https://share.streamlit.io)
3. Connect your repository
4. Add secrets in Streamlit Cloud dashboard
5. Deploy!

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@$GITHUB_USERNAME](https://github.com/$GITHUB_USERNAME)

## 🙏 Acknowledgments

- Streamlit for the amazing framework
- Supabase for backend infrastructure
- Anthropic Claude for AI capabilities

## 📞 Support

For support, email: support@nexusseo.com

---

**Made with ❤️ by $GITHUB_USERNAME**
"@

Set-Content -Path "README.md" -Value $readmeContent
Write-Host "✅ README.md created" -ForegroundColor Green

Write-Host ""
Write-Host "📄 Step 3: Creating requirements.txt..." -ForegroundColor Cyan

$requirementsContent = @"
# Core
streamlit>=1.28.0
python-dotenv>=1.0.0

# Database
supabase>=2.0.0

# HTTP Requests
requests>=2.31.0

# Data Processing
pandas>=2.0.0
numpy>=1.24.0

# Date/Time
python-dateutil>=2.8.2
"@

Set-Content -Path "requirements.txt" -Value $requirementsContent
Write-Host "✅ requirements.txt created" -ForegroundColor Green

Write-Host ""
Write-Host "⚖️ Step 4: Creating LICENSE (MIT)..." -ForegroundColor Cyan

$licenseContent = @"
MIT License

Copyright (c) 2025 $GITHUB_USERNAME

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"@

Set-Content -Path "LICENSE" -Value $licenseContent
Write-Host "✅ LICENSE created" -ForegroundColor Green

Write-Host ""
Write-Host "🔒 Step 5: Checking for secrets..." -ForegroundColor Cyan

if (Test-Path ".streamlit/secrets.toml") {
    Write-Host "⚠️  Found .streamlit/secrets.toml - this will NOT be committed (protected by .gitignore)" -ForegroundColor Yellow
}

if (Test-Path ".env") {
    Write-Host "⚠️  Found .env - this will NOT be committed (protected by .gitignore)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "📦 Step 6: Initializing Git repository..." -ForegroundColor Cyan

if (Test-Path ".git") {
    Write-Host "⚠️  Git repository already exists" -ForegroundColor Yellow
    $REINIT = Read-Host "Do you want to reinitialize? This will delete existing git history. (y/n)"
    if ($REINIT -eq "y") {
        Remove-Item -Path ".git" -Recurse -Force
        git init
        Write-Host "✅ Git repository reinitialized" -ForegroundColor Green
    }
} else {
    git init
    Write-Host "✅ Git repository initialized" -ForegroundColor Green
}

Write-Host ""
Write-Host "➕ Step 7: Adding files to git..." -ForegroundColor Cyan

git add .
Write-Host "✅ Files added" -ForegroundColor Green

Write-Host ""
Write-Host "💾 Step 8: Creating initial commit..." -ForegroundColor Cyan

git commit -m "Initial commit - Nexus SEO Intelligence Platform

- Multi-agent AI SEO analysis system
- Demo, Pro, Agency, and Elite plans
- Admin dashboard for user management
- Clean demo mode (no admin features exposed)
- Supabase integration for database and auth
- Beautiful gradient UI with animations"

Write-Host "✅ Initial commit created" -ForegroundColor Green

Write-Host ""
Write-Host "🌿 Step 9: Setting up main branch..." -ForegroundColor Cyan

git branch -M main
Write-Host "✅ Branch renamed to main" -ForegroundColor Green

Write-Host ""
Write-Host "🔗 Step 10: Adding remote repository..." -ForegroundColor Cyan

$REMOTE_URL = "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
git remote add origin $REMOTE_URL
Write-Host "✅ Remote added: $REMOTE_URL" -ForegroundColor Green

Write-Host ""
Write-Host "🚀 Step 11: Pushing to GitHub..." -ForegroundColor Cyan
Write-Host "⚠️  You may be prompted for GitHub credentials" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "==================================================" -ForegroundColor Green
    Write-Host "✅ SUCCESS! Project uploaded to GitHub!" -ForegroundColor Green
    Write-Host "==================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "🔗 Repository URL:"
    Write-Host "   https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    Write-Host ""
    Write-Host "📋 Next Steps:"
    Write-Host "   1. Go to: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    Write-Host "   2. Add repository description"
    Write-Host "   3. Add topics: seo, ai, streamlit, saas, python"
    Write-Host "   4. Deploy to Streamlit Cloud: https://share.streamlit.io"
    Write-Host ""
    Write-Host "🎉 Happy coding!" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Push failed. Please check your credentials and try again." -ForegroundColor Red
    Write-Host ""
    Write-Host "Common issues:"
    Write-Host "   1. Repository doesn't exist on GitHub - create it first"
    Write-Host "   2. Wrong credentials - check username/password or use SSH"
    Write-Host "   3. No permissions - make sure you own the repository"
    Write-Host ""
    Write-Host "To push manually:"
    Write-Host "   git push -u origin main"
}