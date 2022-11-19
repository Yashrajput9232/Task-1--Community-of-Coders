import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  Expanded Playsound(Color color,int n){
    return  Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            final player = AudioPlayer();
            player.setSource(
              AssetSource('assets_note$n.wav'),
            );
            player.play(AssetSource('assets_note$n.wav'),);
            // right channel only
          },
          child: Text('click me')
            ),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text("Xylophone",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Playsound(Colors.red, 1),
              Playsound(Colors.orange, 2),
              Playsound(Colors.yellow, 3),
              Playsound(Colors.green, 4),
              Playsound(Colors.teal, 5),
              Playsound(Colors.blue, 6),
              Playsound(Colors.purple, 7),

            ],
          ),
        ),
      ),
    );
  }
}