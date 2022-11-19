import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 114, 192, 231),
      appBar: AppBar( 
        title:Center(child: Text('I Am Poor')),
        backgroundColor: Color.fromARGB(255, 48, 166, 225),
      ),
      body: Center(child:Image(
      image:(NetworkImage('https://www.fairobserver.com/wp-content/uploads/2013/09/shutterstock_113310862.jpg')))),
    )
  ));
}

