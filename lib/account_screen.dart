import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Import the ThemeProvider

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('img/fake_user.png'),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe', // Placeholder for user name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 1),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings screen if implemented
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () {
                // Navigate to language settings if implemented
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Toggle Dark Mode'),
              trailing: Switch(
                value: themeProvider.themeData.brightness == Brightness.dark,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
