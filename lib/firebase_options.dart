// Placeholder for firebase_options.dart
// Run `flutterfire configure` to generate the actual file with your project's credentials.
// Do not commit this file if it contains sensitive information.
// For now, just run the command and replace this file.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'platform_app_id.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // This is a placeholder. You must run `flutterfire configure` to get the correct values.
    throw UnsupportedException(
      'initializeFirebase has not been configured for ${Platform.defaultTargetPlatform}',
    );
  }
}