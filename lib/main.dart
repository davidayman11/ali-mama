import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_screen.dart'; // Import the authentication screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        // Add your providers here
        ChangeNotifierProvider(create: (_) => DummyNotifier()),
      ],
      child: AliMamaApp(),
    ),
  );
}

class DummyNotifier extends ChangeNotifier {
  // Dummy class for demonstration
}

class AliMamaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ali Mama',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system, // Use system theme mode
      home: AuthenticationScreen(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
