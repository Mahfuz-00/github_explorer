# 🧭 GitHub Explorer

**A beautiful, fast, and modern GitHub repository browser built with Flutter & Clean Architecture.**

![GitHub Explorer](https://github.com/user-attachments/assets/c611c1ac-8012-440a-9e8a-88ac0c1970ab)  
*Explore GitHub users and their repositories with style.*

---

## ✨ Features

| Feature | Description |
|----------|-------------|
| **User Search** | Enter any GitHub username to view profile & repositories |
| **List/Grid View** | Toggle between list and grid layouts |
| **Smart Sorting** | Sort by: Name (A–Z / Z–A), Date, Stars |
| **Rich Repo Details** | View description, stats, language, dates, and open directly on GitHub |
| **User Header** | Beautiful user header with avatar, name, bio, and stats (repos, followers, following) |
| **Search History** | Last 10 usernames saved locally for quick access |
| **Dark/Light Mode** | Seamless theme toggle support |
| **No Black Flash** | Smooth white native splash on launch |
| **Professional UI** | Built with Material 3 — responsive, modern, and accessible |

---

## 🖼️ Screenshots

| Home (Grid) | Repo Detail | Search History |
|--------------|-------------|----------------|
| ![Grid View](https://github.com/user-attachments/assets/7990c5c3-037b-4a76-b77d-0a06c75b8e75) | ![Detail](https://github.com/user-attachments/assets/cf14af45-72be-4f8c-99d7-a95681009a50) | ![History](https://github.com/user-attachments/assets/4fa23827-3baf-4678-a6a2-b64289c69a7c)   |

---

## 🧰 Tech Stack

- **Framework**: Flutter (Dart)
- **Architecture**: Clean Architecture
- **State Management**: `flutter_bloc`
- **Dependency Injection**: `get_it`
- **Local Storage**: `shared_preferences`
- **Networking**: `http`
- **Image Caching**: `cached_network_image`
- **URL Launching**: `url_launcher`

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ≥ 3.0.0  
- Dart  
- Android Studio / VS Code  

### Installation

```bash
# Clone the repository
git clone https://github.com/Mahfuz-00/assignment_bloc.git
cd assignment_bloc

# Get dependencies
flutter pub get

# Run the app
flutter run
