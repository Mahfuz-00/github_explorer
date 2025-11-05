# GitHub Explorer

**A beautiful, fast, and modern GitHub repository browser built with Flutter & Clean Architecture.**

![GitHub Explorer](https://via.placeholder.com/800x400.png?text=GitHub+Explorer+App+Preview)  
*Explore GitHub users and their repositories with style.*

---

## Features

| Feature | Description |
|-------|-----------|
| **User Search** | Enter any GitHub username to view profile & repos |
| **List/Grid View** | Toggle between list and grid layouts |
| **Smart Sorting** | Sort by: Name (A-Z/Z-A), Date, Stars |
| **Rich Repo Details** | Description, stats, language, dates, "Open in GitHub" |
| **User Header** | Avatar, name, bio, stats (repos, followers, following) |
| **Search History** | Last 10 usernames saved locally |
| **Dark/Light Mode** | Full theme toggle support |
| **No Black Flash** | Smooth white native splash on launch |
| **Professional UI** | Material 3, responsive, accessible |

---

## Screenshots

| Home (Grid) | Repo Detail | Search History |
|------------|-------------|----------------|
| ![Grid View](https://via.placeholder.com/300x600.png?text=Grid+View) | ![Detail](https://via.placeholder.com/300x600.png?text=Repo+Detail) | ![History](https://via.placeholder.com/300x600.png?text=Search+History) |

---

## Tech Stack

- **Framework**: Flutter (Dart)
- **Architecture**: Clean Architecture
- **State Management**: `flutter_bloc`
- **Dependency Injection**: `get_it`
- **Local Storage**: `shared_preferences`
- **Networking**: `http`
- **Image Caching**: `cached_network_image`
- **URL Launching**: `url_launcher`

---

## Project Structure
lib/
├── core/               # DI, navigation, services
├── data/               # Models, repositories, API
├── domain/             # Entities, use cases
├── presentation/       # Pages, BLoC, widgets
└── common/             # Shared widgets, helpers

---

## Getting Started

### Prerequisites

- Flutter SDK (≥3.0.0)
- Dart
- Android Studio / VS Code

### Installation

```bash
# Clone the repo
git clone https://github.com/Mahfuz-00/assignment_bloc.git
cd assignment_bloc

# Get dependencies
flutter pub get

# Run the app
flutter run
