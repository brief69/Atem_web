import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithPasskey() async {
    // TODO: WebAuthnのnavigator.credentials.get()を呼び出し
    // const cred = await navigator.credentials.get({publicKey: options,});

    // WebAuthnの検証が成功した後、サーバーからカスタムトークンを取得
    final response = await http.post(Uri.parse('/generateCustomToken'));
    final data = json.decode(response.body);
    final customToken = data['customToken'];

    // カスタムトークンを使用してFirebaseでサインイン
    await _firebaseAuth.signInWithCustomToken(customToken);
  }
}
