import 'package:flutter/material.dart';

import 'CompareTwoPlayers.dart';

enum Players {
  VideoPlayer,
  VlcPlayer,
  MediaKit,
}

enum Stream {
  Hls,
  Rtsp,
  RtspNimble,
}

class SelectedPlayers {
  Players? player1;
  Stream? stream1;

  Players? player2;
  Stream? stream2;
}

class SelectTwoPlayers extends StatefulWidget {
  const SelectTwoPlayers({super.key});

  @override
  State<SelectTwoPlayers> createState() => _SelectTwoPlayersState();
}

class _SelectTwoPlayersState extends State<SelectTwoPlayers> {
  SelectedPlayers selectedPlayers = SelectedPlayers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione os players'),
      ),
      body: Column(
        children: [
          const Text(
            "Confirgure o Player 1: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DropdownButtonFormField<Players>(
                  menuMaxHeight: 240,
                  decoration: const InputDecoration(
                    label: Text(
                      "Selecione o player",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                  ),
                  items: [
                    DropdownMenuItem<Players>(
                      value: Players.VideoPlayer,
                      child: Text(
                        Players.VideoPlayer.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Players>(
                      value: Players.VlcPlayer,
                      child: Text(
                        Players.VlcPlayer.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Players>(
                      value: Players.MediaKit,
                      child: Text(
                        Players.MediaKit.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedPlayers.player1 = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                flex: 1,
                child: DropdownButtonFormField<Stream>(
                  menuMaxHeight: 240,
                  decoration: const InputDecoration(
                    label: Text(
                      "Selecione a Stream",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                  ),
                  items: [
                    DropdownMenuItem<Stream>(
                      value: Stream.Hls,
                      child: Text(
                        Stream.Hls.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Stream>(
                      value: Stream.Rtsp,
                      child: Text(
                        Stream.Rtsp.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Stream>(
                      value: Stream.RtspNimble,
                      child: Text(
                        Stream.RtspNimble.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedPlayers.stream1 = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Divider(),
          const Text(
            "Confirgure o Player 2: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DropdownButtonFormField<Players>(
                  menuMaxHeight: 240,
                  decoration: const InputDecoration(
                    label: Text(
                      "Selecione o player",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                  ),
                  items: [
                    DropdownMenuItem<Players>(
                      value: Players.VideoPlayer,
                      child: Text(
                        Players.VideoPlayer.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Players>(
                      value: Players.VlcPlayer,
                      child: Text(
                        Players.VlcPlayer.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Players>(
                      value: Players.MediaKit,
                      child: Text(
                        Players.MediaKit.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedPlayers.player2 = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                flex: 1,
                child: DropdownButtonFormField<Stream>(
                  menuMaxHeight: 240,
                  decoration: const InputDecoration(
                    label: Text(
                      "Selecione a Stream",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                  ),
                  items: [
                    DropdownMenuItem<Stream>(
                      value: Stream.Hls,
                      child: Text(
                        Stream.Hls.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Stream>(
                      value: Stream.Rtsp,
                      child: Text(
                        Stream.Rtsp.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    DropdownMenuItem<Stream>(
                      value: Stream.RtspNimble,
                      child: Text(
                        Stream.RtspNimble.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedPlayers.stream2 = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 42,
          ),
          ElevatedButton(
            onPressed: (selectedPlayers.player1 != null &&
                    selectedPlayers.stream1 != null &&
                    selectedPlayers.player2 != null &&
                    selectedPlayers.stream2 != null)
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompareTwoPlayers(
                                selectedPlayers: selectedPlayers,
                              )),
                    );
                  }
                : null,
            child: const Text("Próximo"),
          )
        ],
      ),
    );
  }
}
