import 'package:ali_mama/home_screen.dart';
import 'package:ali_mama/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      home: SplashScreen(),
    );
  }
}
