

// home_page.dart
import 'package:atem/views/widgets/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required title}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final posts = ref;

    return Scaffold(
      backgroundColor: Colors.black,
      body: posts.when(// TODO: What's ishue?
        data: (snapshot) {
          return PageView.builder(
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              return VideoItem(
                post: snapshot.docs[index],
                playVideo: () {
                  // TODO: Video playing logic,How do?
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text("Error: $error")),
      ),
    );
  }
}
