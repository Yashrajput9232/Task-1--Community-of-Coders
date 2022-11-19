import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.teal.shade100,
    appBar: AppBar(
        title: Center(child: Text('I am Rich',style:TextStyle(color: Color.fromARGB(255, 16, 15, 0))),),
        backgroundColor: Colors.teal.shade200),
    body: Center(
      child: Image(
          image: NetworkImage(
              'https://img.freepik.com/free-vector/money-bag-background-design_1270-41.jpg?w=360')),
    ),
  )));
}
