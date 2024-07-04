import 'package:flutter/material.dart';

import 'VideoPlayerWidget.dart';

class VideoPlayerPage extends StatelessWidget {
  final String videoUrl;
  const VideoPlayerPage({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Video Player"),
      ),
      body: Center(
        child: VideoPlayerWidget(
          videoUrl: videoUrl,
        ),
      ),
    );
  }
}
