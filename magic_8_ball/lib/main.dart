import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 158, 212, 255),
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Color.fromARGB(255, 116, 192, 255),
        ),
        body: BallPage(),
      ),
    ),
  );
}

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int n = 1;
  @override
  Widget build(BuildContext) {
    return Center(
      child: Row(children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              n = Random().nextInt(5) + 1;
              setState(() {
              });
            },
            child: Image.asset('Images/ball$n.png'),
          ),
        ),
      ]),
    );
  }
}
