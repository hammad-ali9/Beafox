<div align="center">

# 🦊 BeAFox

### Gamified financial-literacy app that makes learning about money fun

[![Flutter](https://img.shields.io/badge/Flutter-3.41-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android%20%7C%20Web-lightgrey)]()
[![License](https://img.shields.io/badge/License-Proprietary-red)]()

</div>

---

## 📖 Overview

**BeAFox** turns financial education into a game. Learners progress along a
visual "journey map", earn coins, keep streaks and climb levels while working
through interactive lessons and quizzes. The app ships a complete authentication
flow and a gamified home dashboard, built pixel-faithful to the source Figma
design.

> _"More Knowledge, More Money, More Freedom."_

## ✨ Features

| Area | Description |
| --- | --- |
| 🚀 **Splash** | Animated branded splash with a custom dot spinner, auto-routes after 3s |
| 👋 **Onboarding** | Welcome screen with phone mockup and live notification card |
| 🔐 **Auth flow** | Login, registration, forgot-password, OTP code entry, reset password, "welcome back" |
| 🗺️ **Journey map** | Gamified level path drawn with a custom dashed-curve painter |
| 📊 **Stats dashboard** | Lessons, streak %, coins and lives shown as live stat tiles |
| 🌐 **Social sign-in** | Google and Apple continue buttons (UI) |
| 🎨 **Theming** | Dark UI with the signature `#EB8A26` fox-orange accent |

## 🛠️ Tech Stack

- **Flutter** (Material 3) — cross-platform UI
- **google_fonts** — Poppins type system
- **font_awesome_flutter** — iconography
- **CustomPainter** — journey path + splash spinner rendered by hand

## 📂 Project Structure

```
lib/
├── main.dart                       # App entry, theme, routes to splash
└── screens/
    ├── splash_screen.dart          # Animated splash + auto-redirect
    ├── welcome_screen.dart         # Onboarding / get-started
    ├── login_screen.dart           # Email + social login
    ├── registration_screen.dart    # Sign-up
    ├── forgot_password_screen.dart # Request reset
    ├── enter_code_screen.dart      # OTP verification
    ├── reset_password_screen.dart  # New password
    ├── welcome_back_screen.dart    # Post-login confirmation
    └── home_screen.dart            # Gamified journey dashboard
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.11.5`
- A connected device, emulator or Chrome

### Run

```bash
flutter pub get      # install dependencies
flutter run          # launch on the default device
```

### Build release

```bash
flutter build apk --release      # Android
flutter build ios --release      # iOS
flutter build web --release      # Web
```

## 🧪 Testing

Widget tests cover the splash → onboarding hand-off and the auth entry point.

```bash
flutter test                       # run all tests
flutter test --reporter expanded   # verbose output
```

The latest run log is saved under [`logs/test_results.log`](logs/test_results.log).

## 📸 Screenshots

> Add device captures to `assets/screenshots/` and reference them here.

---

<div align="center">
<sub>Built with Flutter • Design recreated from Figma</sub>
</div>
