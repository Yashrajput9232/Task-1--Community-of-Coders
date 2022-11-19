import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 165, 211, 230),
          body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: <Widget>[
            CircleAvatar(
                radius: 50.0, backgroundImage: AssetImage('images/sejal.jpeg')),
            Text(
              'Sejal Barai',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.00,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter DEVELOPER',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.00,
            width:150.0,
            child: Divider( 
              color: Color.fromARGB(255, 118, 162, 159)) ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                
                    Icons.add_call,
                    color: Color.fromARGB(136, 16, 33, 33),
                  ),
                  title:
                 Text('9130184587',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ))
                
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Color.fromARGB(136, 16, 33, 33),
                ),
                title: Text('sbarai_b21@et.vjti.ac.in',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'Source Sans Pro',
                    )),
              ),
            )
          ])))));
}
