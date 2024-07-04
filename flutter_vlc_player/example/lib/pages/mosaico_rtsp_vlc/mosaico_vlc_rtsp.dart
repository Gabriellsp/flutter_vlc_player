import 'package:flutter/material.dart';

import '../players/VlcPlayer/VlcPlayerWidget.dart';

class MosaicoVlcRtsp extends StatefulWidget {
  const MosaicoVlcRtsp({super.key, required this.videoUrls});
  final List<String> videoUrls;
  @override
  State<MosaicoVlcRtsp> createState() => _MosaicoVlcRtspState();
}

class _MosaicoVlcRtspState extends State<MosaicoVlcRtsp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mosaico com Vlc Player'),
      ),
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: widget.videoUrls
              .map(
                (e) => VlcPlayerWidget(videoUrl: e),
              )
              .toList()),
    );
  }
}
