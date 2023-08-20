import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


// Arrow function can be only use for one line functions unlike JavaScript
void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  // Key of the XylophoneApp
  // A function that return A Widget can be used in flutter
  // Also Expanded buildKey(Color color, int soundNumber)  => buildKey(Color color, int soundNumber) is fine
  Expanded buildKey({ required Color color, required int soundNumber}){
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          // Remove the curved edge
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            backgroundColor:
            MaterialStateProperty.all<Color>(color)),
        onPressed: () async {
          playSound(soundNumber);
        },
        child: const Text(''),
      ),
    );
  }


  // Play the sound
  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber:2),
              buildKey(color: Colors.yellow, soundNumber:3),
              buildKey(color: Colors.green, soundNumber:4),
              buildKey(color: Colors.blue, soundNumber:5),
              buildKey(color: Colors.indigo, soundNumber:6),
              buildKey(color: Colors.purple, soundNumber:7),
            ],
          ),
        ),
      ),
    );
  }
}
