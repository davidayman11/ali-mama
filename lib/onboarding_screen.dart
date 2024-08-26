import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> _titles = ["Welcome", "Discover", "Shop Now"];
  final PageController _pageController = PageController();

  void _onPageChanged(int index) async {
    if (index == _titles.length - 1) {
      // Save that onboarding is completed
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('onboardingCompleted', true);
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _titles.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    _titles[index],
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
              if (index == _titles.length - 1)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: _navigateToHome,
                      child: Text('Go to Home'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
