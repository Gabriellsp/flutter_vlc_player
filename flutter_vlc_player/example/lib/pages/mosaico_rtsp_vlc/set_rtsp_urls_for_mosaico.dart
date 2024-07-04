import 'package:flutter/material.dart';

import 'mosaico_vlc_rtsp.dart';

class SetRtspUrlsForMosaico extends StatefulWidget {
  const SetRtspUrlsForMosaico({
    super.key,
    required this.playersNumber,
  });

  final int playersNumber;

  @override
  State<SetRtspUrlsForMosaico> createState() => _SetRtspUrlsForMosaicoState();
}

class _SetRtspUrlsForMosaicoState extends State<SetRtspUrlsForMosaico> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
        widget.playersNumber, (index) => TextEditingController(text: ""));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurar urls rtsp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(_controllers.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        controller: _controllers[index],
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          labelText: 'Url RTSP ${index + 1}',
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: ((_controllers.where((element) => element.text != ""))
                          .length ==
                      widget.playersNumber)
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MosaicoVlcRtsp(
                                  videoUrls:
                                      _controllers.map((e) => e.text).toList(),
                                )),
                      );
                    }
                  : null,
              child: const Text("Próximo"),
            ),
          ],
        ),
      ),
    );
  }
}
