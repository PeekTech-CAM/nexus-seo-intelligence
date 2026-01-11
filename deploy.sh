#!/bin/bash

# Nexus SEO Intelligence - GitHub Upload Script
# This script will set up git and push your project to GitHub

echo "🎯 Nexus SEO Intelligence - GitHub Upload Script"
echo "=================================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed. Please install git first.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Git is installed${NC}"
echo ""

# Get GitHub username and repository name
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter repository name (default: nexus-seo-intelligence): " REPO_NAME
REPO_NAME=${REPO_NAME:-nexus-seo-intelligence}

echo ""
echo "📋 Configuration:"
echo "   GitHub Username: $GITHUB_USERNAME"
echo "   Repository: $REPO_NAME"
echo "   URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

read -p "Is this correct? (y/n): " CONFIRM
if [ "$CONFIRM" != "y" ]; then
    echo -e "${YELLOW}Aborted by user${NC}"
    exit 0
fi

echo ""
echo "🔧 Step 1: Creating .gitignore file..."

cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
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
EOF

echo -e "${GREEN}✅ .gitignore created${NC}"

echo ""
echo "📝 Step 2: Creating README.md..."

cat > README.md << EOF
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
\`\`\`bash
git clone https://github.com/$GITHUB_USERNAME/$REPO_NAME.git
cd $REPO_NAME
\`\`\`

2. **Create virtual environment**
\`\`\`bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\\Scripts\\activate
\`\`\`

3. **Install dependencies**
\`\`\`bash
pip install -r requirements.txt
\`\`\`

4. **Set up environment variables**

Create \`.streamlit/secrets.toml\`:
\`\`\`toml
SUPABASE_URL = "your_supabase_url_here"
SUPABASE_KEY = "your_supabase_anon_key_here"
\`\`\`

5. **Run the application**
\`\`\`bash
streamlit run app.py
\`\`\`

The app will open at \`http://localhost:8501\`

## 📁 Project Structure

\`\`\`
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

\`\`\`

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

Admin users (configured in \`ADMIN_EMAILS\`) can access:
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

### Docker (Coming Soon)

\`\`\`bash
docker build -t nexus-seo .
docker run -p 8501:8501 nexus-seo
\`\`\`

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
EOF

echo -e "${GREEN}✅ README.md created${NC}"

echo ""
echo "📄 Step 3: Creating requirements.txt..."

cat > requirements.txt << 'EOF'
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
EOF

echo -e "${GREEN}✅ requirements.txt created${NC}"

echo ""
echo "⚖️ Step 4: Creating LICENSE (MIT)..."

cat > LICENSE << EOF
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
EOF

echo -e "${GREEN}✅ LICENSE created${NC}"

echo ""
echo "🔒 Step 5: Checking for secrets..."

if [ -f ".streamlit/secrets.toml" ]; then
    echo -e "${YELLOW}⚠️  Found .streamlit/secrets.toml - this will NOT be committed (protected by .gitignore)${NC}"
fi

if [ -f ".env" ]; then
    echo -e "${YELLOW}⚠️  Found .env - this will NOT be committed (protected by .gitignore)${NC}"
fi

echo ""
echo "📦 Step 6: Initializing Git repository..."

# Check if already initialized
if [ -d ".git" ]; then
    echo -e "${YELLOW}⚠️  Git repository already exists${NC}"
    read -p "Do you want to reinitialize? This will delete existing git history. (y/n): " REINIT
    if [ "$REINIT" = "y" ]; then
        rm -rf .git
        git init
        echo -e "${GREEN}✅ Git repository reinitialized${NC}"
    fi
else
    git init
    echo -e "${GREEN}✅ Git repository initialized${NC}"
fi

echo ""
echo "➕ Step 7: Adding files to git..."

git add .
echo -e "${GREEN}✅ Files added${NC}"

echo ""
echo "💾 Step 8: Creating initial commit..."

git commit -m "Initial commit - Nexus SEO Intelligence Platform

- Multi-agent AI SEO analysis system
- Demo, Pro, Agency, and Elite plans
- Admin dashboard for user management
- Clean demo mode (no admin features exposed)
- Supabase integration for database and auth
- Beautiful gradient UI with animations"

echo -e "${GREEN}✅ Initial commit created${NC}"

echo ""
echo "🌿 Step 9: Setting up main branch..."

git branch -M main
echo -e "${GREEN}✅ Branch renamed to main${NC}"

echo ""
echo "🔗 Step 10: Adding remote repository..."

REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
git remote add origin "$REMOTE_URL"
echo -e "${GREEN}✅ Remote added: $REMOTE_URL${NC}"

echo ""
echo "🚀 Step 11: Pushing to GitHub..."
echo -e "${YELLOW}⚠️  You may be prompted for GitHub credentials${NC}"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "=================================================="
    echo -e "${GREEN}✅ SUCCESS! Project uploaded to GitHub!${NC}"
    echo "=================================================="
    echo ""
    echo "🔗 Repository URL:"
    echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "📋 Next Steps:"
    echo "   1. Go to: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo "   2. Add repository description"
    echo "   3. Add topics: seo, ai, streamlit, saas, python"
    echo "   4. Deploy to Streamlit Cloud: https://share.streamlit.io"
    echo ""
    echo "🎉 Happy coding!"
else
    echo ""
    echo -e "${RED}❌ Push failed. Please check your credentials and try again.${NC}"
    echo ""
    echo "Common issues:"
    echo "   1. Repository doesn't exist on GitHub - create it first"
    echo "   2. Wrong credentials - check username/password or use SSH"
    echo "   3. No permissions - make sure you own the repository"
    echo ""
    echo "To push manually:"
    echo "   git push -u origin main"
fi