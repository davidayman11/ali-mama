import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/fake_user.png'), // Replace with an actual image
            ),
            SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: false,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
