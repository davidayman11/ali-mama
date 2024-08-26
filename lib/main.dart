import 'package:ali_mama/home_screen.dart';
import 'package:ali_mama/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Import the ThemeProvider

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Add your providers here
        ChangeNotifierProvider(create: (_) => ThemeProvider(ThemeData.light())), // Add ThemeProvider
        ChangeNotifierProvider(create: (_) => DummyNotifier()), // Placeholder
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
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Ali Mama',
          theme: themeProvider.themeData, // Use ThemeProvider for theming
          home: SplashScreen(),
          debugShowCheckedModeBanner: false, // Remove the debug banner
        );
      },
    );
  }
}
