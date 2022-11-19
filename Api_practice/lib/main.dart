import 'dart:convert';
import 'dart:ffi';
import 'package:api_practice/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_practice/Model/sample.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(ApiTest());
}

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  List<Sample> postlist = [];
  Future<List<Sample>> getPostapi() async {
    final responce = await http.get(Uri.parse('https://fakestoreapi.com/products'));
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
          backgroundColor: Colors.red[400],
          title: const Center(
            child: Text(
              'Product Store ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.black54,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: FutureBuilder(
                    future: getPostapi(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          color: Colors.green,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoadingAnimationWidget.fourRotatingDots(
                                color: Colors.black,
                                size: 100,
                              ),
                              const Text(
                                'Loading..',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      else {
                        return ListView.builder(
                          itemCount: postlist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30.0, 30.0, 20.0, 30.0),
                                        child: Image(
                                          image: NetworkImage(
                                            postlist[index].image.toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Card(
                                              color: Colors.tealAccent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '\$' + postlist[index].price.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              'Discription: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              postlist[index].description.toString(),
                                            ),

                                            TextButton(
                                              onPressed: () {

                                                },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                color: Colors.green,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text('Order  Now  ',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
