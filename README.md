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
```bash
git clone https://github.com/PeekTech-CAM/nexus-seo-intelligence.git
cd nexus-seo-intelligence
```

2. **Create virtual environment**
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. **Install dependencies**
```bash
pip install -r requirements.txt
```

4. **Set up environment variables**

Create `.streamlit/secrets.toml`:
```toml
SUPABASE_URL = "your_supabase_url_here"
SUPABASE_KEY = "your_supabase_anon_key_here"
```

5. **Run the application**
```bash
streamlit run app.py
```

The app will open at `http://localhost:8501`

## 📁 Project Structure

```
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

```

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

Admin users (configured in `ADMIN_EMAILS`) can access:
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

```bash
docker build -t nexus-seo .
docker run -p 8501:8501 nexus-seo
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@PeekTech-CAM](https://github.com/PeekTech-CAM)

## 🙏 Acknowledgments

- Streamlit for the amazing framework
- Supabase for backend infrastructure
- Anthropic Claude for AI capabilities

## 📞 Support

For support, email: support@nexusseo.com

---

**Made with ❤️ by PeekTech-CAM**
