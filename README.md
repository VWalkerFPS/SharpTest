<div align="center">

# SharpTest

### Native iOS application for learning C# through interactive quizzes

Built with **Swift**, **UIKit**, **MVVM**, and the **Coordinator** pattern.

Programmatic UI • Clean Architecture • UIKit • No Storyboards

</div>

---

# 📱 Screenshots

| Tests | Quiz | Results |
|:------:|:----:|:-------:|
| ![](Screenshots/tests.png) | ![](Screenshots/quiz.png) | ![](Screenshots/result.png) |

---

# ✨ Features

- 📚 Browse available C# quizzes
- ✅ Multiple correct answers support
- 📈 Quiz progress tracking
- 📝 Interactive quiz interface
- 🎯 Result screen with score
- 💾 Local data storage using UserDefaults
- 🧩 Programmatic UIKit interface
- 🏛 MVVM architecture
- 🧭 Coordinator-based navigation

---

# 🛠 Tech Stack

| Category | Technologies |
|----------|--------------|
| Language | Swift |
| UI | UIKit |
| Architecture | MVVM |
| Navigation | Coordinator |
| Layout | Auto Layout |
| Storage | UserDefaults |
| Patterns | Repository Pattern |
| Lists | UITableView |

---

# 🏛 Architecture

The application follows the **MVVM** architecture.

Navigation between screens is handled using the **Coordinator** pattern.

```text
App
│
├── Navigation
│   ├── AppCoordinator
│   └── TestsCoordinator
│
├── Models
├── Services
├── Repositories
├── Storage
├── ViewModels
├── ViewControllers
└── Views
```

---

# 📂 Project Structure

```text
SharpTest
│
├── App
├── Data
├── Design
├── Extensions
├── Models
├── Navigation
├── Repositories
├── Services
├── Storage
├── ViewControllers
├── ViewModels
└── Views
```

---

# 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/SharpTest.git
```

### Open the project

```
SharpTest.xcodeproj
```

### Run

Build and run the application in Xcode.

---

# 🗺 Roadmap

- [x] MVVM architecture
- [x] Coordinator navigation
- [x] Repository pattern
- [x] Local storage
- [x] Programmatic UIKit UI
- [ ] REST API integration
- [ ] User authentication
- [ ] Quiz history
- [ ] Statistics screen
- [ ] Dark Mode
- [ ] Unit Tests
- [ ] SwiftData / CoreData

---

# 👨‍💻 Author

**Dmitry Chebotarev**

Aspiring iOS Developer

Swift • UIKit • MVVM • Coordinator

---

If you found this project interesting, feel free to ⭐ the repository.