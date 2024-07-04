import 'package:flutter/material.dart';

import '../../db/db.dart';
import '../players/MediaKit/MediaKitPlayerWidget.dart';
import '../players/VideoPlayer/VideoPlayerWidget.dart';
import '../players/VlcPlayer/VlcPlayerWidget.dart';
import 'SelectTwoPlayers.dart';

class CompareTwoPlayers extends StatefulWidget {
  final SelectedPlayers selectedPlayers;
  const CompareTwoPlayers({super.key, required this.selectedPlayers});

  @override
  State<CompareTwoPlayers> createState() => _CompareTwoPlayersState();
}

class _CompareTwoPlayersState extends State<CompareTwoPlayers> {
  @override
  Widget build(BuildContext context) {
    final player1Widget = _getPlayer(
        player: widget.selectedPlayers.player1!,
        stream: widget.selectedPlayers.stream1!);
    final player2Widget = _getPlayer(
        player: widget.selectedPlayers.player2!,
        stream: widget.selectedPlayers.stream2!);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparação entre dois players'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
                "${widget.selectedPlayers.player1!.name} (${widget.selectedPlayers.stream1!.name}):"),
            player1Widget,
            const SizedBox(
              height: 20,
            ),
            Text(
                "${widget.selectedPlayers.player2!.name} (${widget.selectedPlayers.stream2!.name}):"),
            player2Widget,
          ],
        ),
      ),
    );
  }

  Widget _getPlayer({required Players player, required Stream stream}) {
    final videoUrl = _getStream(stream: stream);
    switch (player) {
      case Players.VideoPlayer:
        return VideoPlayerWidget(videoUrl: videoUrl);
      case Players.VlcPlayer:
        return VlcPlayerWidget(videoUrl: videoUrl);
      case Players.MediaKit:
        return MediaKitPlayerWidget(videoUrl: videoUrl);
    }
  }

  String _getStream({required Stream stream}) {
    switch (stream) {
      case Stream.Hls:
        return Db.hlsUrl;
      case Stream.Rtsp:
        return Db.rtspUrl;
      case Stream.RtspNimble:
        return Db.rtspNimbleUrl;
    }
  }
}
