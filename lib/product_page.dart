import 'package:flutter/material.dart';
import 'package:task_1_coc/add_API.dart';
import 'loading_animation.dart';
import 'dart:math';
import 'package:task_1_coc/orderNowPage.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  AddApi getApi = AddApi();
  int orderNumber=0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getApi.getPostapi(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return animation();
        } else {
          return ListView.builder(
            itemCount: getApi.getPostlistLength(),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/Images4.jpg'),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
                              image: NetworkImage(getApi.getImage(index)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        color: Colors.green
                                      ),

                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          Text(getApi.getRate(index),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      color: Colors.red[100],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '\$${getApi.getPrice(index)}',
                                           style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(getApi.getTitle(index),
                                  style: const TextStyle(
                                    fontWeight:FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const Text(
                                  'Category: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(getApi.getCategoty(index),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),


                                GestureDetector(
                                  onTap: () {
                                    int n = int.parse(getApi.getId(index),);
                                        Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => OrderNow(n),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    color: Colors.cyanAccent,
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Order  Now  ',
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
                ),
              );
            },
          );
        }
      },
    );
  }
}
