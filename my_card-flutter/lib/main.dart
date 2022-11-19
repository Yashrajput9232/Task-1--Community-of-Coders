import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage("images/photo.jpg"),
                ),
                Text(
                  'Shubham Nanote',
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 2,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'islandMoments',
                  ),
                ),
                Text(
                  "Student",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 250,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "+91 76668 04584",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ]),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Shubhamnanote205@gmail.com",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
