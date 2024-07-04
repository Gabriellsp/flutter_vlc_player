import 'package:flutter/material.dart';

import '../../../db/db.dart';
import 'VideoPlayerPage.dart';

class SelectVideoPlayerUrl extends StatelessWidget {
  const SelectVideoPlayerUrl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione a stream da camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(
                            videoUrl: Db.hlsUrl,
                          )),
                );
              },
              child: const Text('Hls'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(
                            videoUrl: Db.rtspUrl,
                          )),
                );
              },
              child: const Text('Rtsp'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(
                            videoUrl: Db.rtspNimbleUrl,
                          )),
                );
              },
              child: const Text('Rtsp Nimble'),
            ),
          ],
        ),
      ),
    );
  }
}
