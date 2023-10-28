

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasskeySignIn extends StatefulWidget {
  const PasskeySignIn({Key? key}) : super(key: key);

  @override
  PasskeySignInState createState() => PasskeySignInState();
}

class PasskeySignInState extends State<PasskeySignIn> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String passkey = '';

  Future<void> _signIn() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(email: email, password: passkey);
      // ignore: unnecessary_null_comparison
      if (user != null) {
        // TODO: Navigate to the main screen or dashboard
      } else {
        // TODO: Show an error message
      }
    } catch (e) {
      (e);
      // TODO: Handle the error properly, e.g., show a dialog with the error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignIn')),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'email'),
              onChanged: (value) => email = value,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(labelText: 'password'),
              onChanged: (value) => passkey = value,
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text('SignIn'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              child: const Text('アカウントをお持ちでない方'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
