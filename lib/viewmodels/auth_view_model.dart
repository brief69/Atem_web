

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, User?>(
  (ref) => AuthViewModel(ref.read),
);

class AuthViewModel extends StateNotifier<User?> {
  final Reader read;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthViewModel(this.read) : super(auth.currentUser) {
    _auth.userChanges().listen((user) => state = user);
  }

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  bool get isAnonymous => state?.isAnonymous ?? true;
}
