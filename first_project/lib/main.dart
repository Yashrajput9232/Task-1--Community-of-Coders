import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Hello'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/first.jpg'),
          ),
        ),
      ),
    );
  }
}
