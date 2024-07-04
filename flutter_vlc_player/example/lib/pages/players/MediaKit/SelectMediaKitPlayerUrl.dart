import 'package:flutter/material.dart';

import '../../../db/db.dart';
import 'MediaKitPlayerPage.dart';

class SelectMediaKitPlayerUrl extends StatefulWidget {
  const SelectMediaKitPlayerUrl({super.key});

  @override
  State<SelectMediaKitPlayerUrl> createState() =>
      _SelectMediaKitPlayerUrlState();
}

class _SelectMediaKitPlayerUrlState extends State<SelectMediaKitPlayerUrl> {
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
                      builder: (context) => MediaKitPlayerPage(
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
                      builder: (context) => MediaKitPlayerPage(
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
                      builder: (context) => MediaKitPlayerPage(
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
