import 'dart:convert';
import 'dart:ffi';
import 'package:api_practice/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_practice/Model/sample.dart';

class SecondPage extends StatefulWidget {

  final int n;
  SecondPage(this.n);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {


  List<Sample> postlist = [];
  Future<List<Sample>> getPostapi() async {
    final responce =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      for (Map i in data) {
        postlist.add(Sample.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Second page'),
        ),
        body: Column(children: [
          Expanded(
            child: FutureBuilder(
                future: getPostapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading');
                  } else {
                    return  Column(
                      children: [
                        Image(image: NetworkImage(postlist[0].image.toString())),
                      ],
                    );
                  };
                }),
          ),
        ]),
      ),
    );
  }
}



// PageView.builder(
// itemBuilder: (context, index) {
// return Expanded(
// child: Column(
// children: [
// Expanded(
// child: Image(
// image: NetworkImage(
// postlist[index].image.toString(),
// ),
// ),
// ),
// ],
// ),
// );
// },
//);