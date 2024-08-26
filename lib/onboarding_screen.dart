import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final List<String> _titles = ["Welcome", "Discover", "Shop Now"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: _titles.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                _titles[index],
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          );
        },
        onPageChanged: (index) async {
          if (index == _titles.length - 1) {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('onboardingCompleted', true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
      ),
    );
  }
}
