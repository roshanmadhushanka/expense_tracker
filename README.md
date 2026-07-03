# Expense Tracker

A Flutter expense tracker app targeting Android and iOS.

## Features

- **Google Sign-In**: Secure authentication using Google.
- **Expense Management**: Add, view, and track expenses.
- **Data Persistence**: Uses Firebase Firestore for storing user data.

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / Xcode
- Firebase Project

### Firebase Setup

1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Create a new project or select an existing one.
3. Add an Android app and an iOS app to the project.
4. Download the `google-services.json` file for Android and place it in `android/app/`.
5. Download the `GoogleService-Info.plist` file for iOS and place it in `ios/Runner/`.
6. Enable **Google Sign-In** in the Firebase Authentication section.
7. Run the following command to initialize the FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
   This will automatically update the `lib/firebase_options.dart` file.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/roshanmadhushanka/expense_tracker.git
   ```
2. Navigate to the project directory:
   ```bash
   cd expense_tracker
   ```
3. Get the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/models/`: Data models (e.g., `expense_model.dart`).
- `lib/services/`: Services for authentication and data management (e.g., `auth_service.dart`, `firestore_service.dart`).
- `lib/screens/`: UI screens (e.g., `login_screen.dart`, `home_screen.dart`).
- `lib/main.dart`: Entry point of the application.

## License

This project is licensed under the MIT License.