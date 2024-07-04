import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  String error = '';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    initialize();
  }

  Future<void> initialize() async {
    _controller.addListener(() => _checkErrorPlayer());
    await _controller.initialize();
    await _controller.play();
  }

  _checkErrorPlayer() {
    if (_controller.value.hasError) {
      setState(() {
        error =
            _controller.value.errorDescription ?? "Descrição do erro vazia!";
      });
    }
  }

  @override
  void dispose() async {
    Future.microtask(() {
      _controller.removeListener(() => _checkErrorPlayer());
      _controller.dispose();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 150, child: VideoPlayer(_controller)),
        const SizedBox(
          height: 4,
        ),
        Visibility(
          visible: error.isNotEmpty,
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                "Erro no VideoPlayer: $error",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
