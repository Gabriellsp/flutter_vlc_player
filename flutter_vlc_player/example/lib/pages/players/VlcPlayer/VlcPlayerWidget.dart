import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const VlcPlayerWidget({required this.videoUrl, super.key});

  @override
  State<VlcPlayerWidget> createState() => _VlcPlayerWidgetState();
}

class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
  late VlcPlayerController _controller;
  String error = '';

  @override
  void initState() {
    super.initState();
    _controller = VlcPlayerController.network(
      widget.videoUrl,
      autoPlay: true,
      hwAcc: HwAcc.full,
      options: VlcPlayerOptions(
        advanced: VlcAdvancedOptions([
          VlcAdvancedOptions.networkCaching(300),
        ]),
        http: VlcHttpOptions([
          VlcHttpOptions.httpReconnect(true),
        ]),
        extras: [
          ':high-priority',
          ':rtsp-mcast',
          ':rtsp-tcp',
          ':avcodec-hw=any',
          ':codec=avcodec',
          ':vcodec=h264',
          ':no-plugins-cache',
          ':access=none',
          ':services-discovery=none',
          ':no-lua',
          ':no-sap-parse',
          // '--access=none',
          // '--access={none}',
          // '--services-discovery=none',
          // '--no-lua',
          // '--no-sap-parse',
        ],
      ),
    );
    _controller.addListener(() => _checkErrorPlayer());
  }

  _checkErrorPlayer() {
    if (_controller.value.hasError) {
      setState(() {
        error = _controller.value.errorDescription;
      });
    }
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    _controller.removeListener(_checkErrorPlayer);
    await _controller.stopRecording();
    await _controller.stopRendererScanning();
    await _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VlcPlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          placeholder: const Center(child: CircularProgressIndicator()),
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
                "Erro no VlcPlayer: $error",
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
