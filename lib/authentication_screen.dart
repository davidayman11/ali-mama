import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool _isSignIn = true; // Toggle between Sign In and Sign Up

  Future<void> _authenticate() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_isSignIn) {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Navigate to home screen after successful sign-in
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Navigate to home screen after successful sign-up
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignIn ? 'Sign In' : 'Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _authenticate,
              child: Text(_isSignIn ? 'Sign In' : 'Sign Up'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  _isSignIn = !_isSignIn;
                });
              },
              child: Text(_isSignIn
                  ? 'Don\'t have an account? Sign Up'
                  : 'Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
