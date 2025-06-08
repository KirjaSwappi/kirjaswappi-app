# KirjaSwapp

A Flutter application for book swapping and trading, built with modern architecture and best practices.

## Features

- User authentication (sign up, login, password reset)
- Email verification
- Book listing and management
- Book swapping functionality
- User profiles
- Real-time notifications
- Modern Material Design 3 UI

## Architecture

The app follows a clean architecture pattern with the following structure:

```
lib/
├── core/
│   ├── constants/
│   ├── network/
│   ├── router/
│   └── utils/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── books/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── shared/
    └── widgets/
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/kirjaswappi-app.git
```

2. Navigate to the project directory:
```bash
cd kirjaswappi-app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Dependencies

- `flutter_riverpod` - State management
- `go_router` - Navigation
- `dio` - HTTP client
- `shared_preferences` - Local storage
- `flutter_secure_storage` - Secure storage
- `intl` - Internationalization

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- All contributors who have helped shape this project
