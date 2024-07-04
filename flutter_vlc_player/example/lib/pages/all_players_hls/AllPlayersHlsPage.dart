import 'package:flutter/material.dart';

import '../../db/db.dart';
import '../players/MediaKit/MediaKitPlayerWidget.dart';
import '../players/VideoPlayer/VideoPlayerWidget.dart';
import '../players/VlcPlayer/VlcPlayerWidget.dart';

class AllPlayersHlsPage extends StatefulWidget {
  const AllPlayersHlsPage({super.key});

  @override
  State<AllPlayersHlsPage> createState() => _AllPlayersHlsPageState();
}

class _AllPlayersHlsPageState extends State<AllPlayersHlsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos os Players em Hls'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("VideoPlayer: "),
            VideoPlayerWidget(
              videoUrl: Db.hlsUrl,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("VlcPlayer: "),
            VlcPlayerWidget(
              videoUrl: Db.hlsUrl,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("MediaKitPlayer: "),
            MediaKitPlayerWidget(
              videoUrl: Db.hlsUrl,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
