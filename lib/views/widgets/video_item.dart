

// video_item.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VideoItem extends StatefulWidget {
  final DocumentSnapshot post;
  final Function playVideo;

  const VideoItem({Key? key, required this.post, required this.playVideo}) : super(key: key);

  @override
  VideoItemState createState() => VideoItemState();
}

class VideoItemState extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9, // TODO; この値は調整する
          child: GestureDetector(
            onTap: () => widget.playVideo(),
            child: const Icon(Icons.play_arrow, size: 100, color: Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.post["userIcon"]),
            ),
            title: Text(widget.post["userName"], style: const TextStyle(color: Colors.white)),
            subtitle: Text(widget.post["caption"], style: const TextStyle(color: Colors.white)),
          ),
        ),
        // 他のUI要素...
      ],
    );
  }
}
