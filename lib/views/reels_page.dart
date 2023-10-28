

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:atem/viewmodels/auth_view_model.dart';

class ReelsPage extends ConsumerWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authViewModelProvider);

    return Scaffold(
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : user.isAnonymous
              ? const LimitedVideoView()
              : const FullAccessVideoView(),
    );
  }
}

class LimitedVideoView extends StatelessWidget {
  const LimitedVideoView({Key? key, superKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ここで動画を9つだけ表示
        // ...

        ElevatedButton(
          onPressed: () {
            // 他の機能にアクセスしようとするとモーダルで登録ページを表示
            showModalBottomSheet(
              context: context,
              builder: (context) => const RegisterPage(),
            );
          },
          child: const Text("他の機能を使用する"),
        )
      ],
    );
  }
}

class FullAccessVideoView extends StatelessWidget {
  const FullAccessVideoView({Key? key, superKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 全ての動画や機能にアクセスできるビューを表示
    return Container(); // この部分を実装してください。
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key, superKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 登録ページの実装
    return Container(); // この部分を実装してください。
  }
}
