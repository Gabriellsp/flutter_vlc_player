import 'package:flutter/material.dart';

import 'VlcPlayerWidget.dart';

class VlcPlayerPage extends StatefulWidget {
  final String videoUrl;
  const VlcPlayerPage({super.key, required this.videoUrl});

  @override
  State<VlcPlayerPage> createState() => _VlcPlayerPageState();
}

class _VlcPlayerPageState extends State<VlcPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Vlc Player"),
      ),
      body: Center(
        child: VlcPlayerWidget(
          videoUrl: widget.videoUrl,
        ),
      ),
    );
  }
}
