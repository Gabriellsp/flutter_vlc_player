import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MediaKitPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const MediaKitPlayerWidget({super.key, required this.videoUrl});

  @override
  State<MediaKitPlayerWidget> createState() => _MediaKitPlayerWidgetState();
}

class _MediaKitPlayerWidgetState extends State<MediaKitPlayerWidget> {
  late final player = Player(
      configuration: const PlayerConfiguration(
    bufferSize: 100,
    vo: '',
    libass: true,
    muted: true,
  ));
  late final controller = VideoController(player,
      configuration: const VideoControllerConfiguration(
        androidAttachSurfaceAfterVideoParameters: true,
      ));
  String error = '';

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.videoUrl));
    player.stream.error.listen((String event) {
      setState(() {
        error = event;
      });
    });
  }

  @override
  void dispose() async {
    await player.stop();
    await player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Video(
          height: 150,
          controller: controller,
        ),
        const SizedBox(
          height: 4,
        ),
        Visibility(
          visible: error.isNotEmpty,
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                "Erro no MediaKit: $error",
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
