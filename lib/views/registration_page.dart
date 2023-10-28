
import 'package:flutter/material.dart';
import 'package:atem/views/passkey_sign_in.dart';

class PasskeyRegistrationPage extends StatefulWidget {
  const PasskeyRegistrationPage({Key? key}) : super(key: key);

  @override
  PasskeyRegistrationPageState createState() => PasskeyRegistrationPageState();
}

class PasskeyRegistrationPageState extends State<PasskeyRegistrationPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("新規登録")),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "月額1800円",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "メールアドレス",
                hintText: "example@example.com",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ここでパスキーの登録ロジックを実装します
                // _registerPasskey(_emailController.text);
              },
              child: const Text("登録"),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("すでに登録済みですか？"),
                TextButton(
                  onPressed: () {
                    // ここでサインインページへの遷移ロジックを実装します
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PasskeySignIn()));
                  },
                  child: const Text("SignUp"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // パスキーの登録ロジック
  void registerPasskey(String email) {
    // TODO: Googleのドキュメントに従ったパスキーの登録ロジックを実装する
  }
}
