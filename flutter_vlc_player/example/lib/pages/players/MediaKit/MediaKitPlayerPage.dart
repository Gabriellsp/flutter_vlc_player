import 'package:flutter/material.dart';

import 'MediaKitPlayerWidget.dart';

class MediaKitPlayerPage extends StatefulWidget {
  final String videoUrl;
  const MediaKitPlayerPage({super.key, required this.videoUrl});

  @override
  State<MediaKitPlayerPage> createState() => _MediaKitPlayerPageState();
}

class _MediaKitPlayerPageState extends State<MediaKitPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MediaKit Player"),
      ),
      body: Center(
        child: MediaKitPlayerWidget(
          videoUrl: widget.videoUrl,
        ),
      ),
    );
  }
}
