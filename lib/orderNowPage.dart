import 'package:flutter/material.dart';
import 'package:task_1_coc/add_API.dart';


class OrderNow extends StatefulWidget {
  final int idNumber;

  const OrderNow(this.idNumber);

  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  AddApi getApi = AddApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getApi.getPostapi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.cyan,
              ),
              child: const Center(
                child: Text('Loading....',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 30,
                  ),),
              ),
            );
          } else {
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text("Product Store"),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Image(
                              image: NetworkImage(
                                getApi.getImage(widget.idNumber - 1),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Card(
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '\$${getApi.getPrice(widget.idNumber-1)}',
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Text('Discription: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                getApi.getDiscription(widget.idNumber - 1),
                              ),
                              const Text('Category: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                getApi.getCategoty(widget.idNumber - 1),
                              ),

                                ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FloatingActionButton.extended(
                                label: const Text('Wishlist'),
                                backgroundColor: Colors.grey,
                                icon: const Icon(
                                  Icons.favorite,
                                  size: 24.0,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: FloatingActionButton.extended(
                                label: const Text('Order Now',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                                ),),
                                backgroundColor: Colors.red,
                                icon: const Icon(
                                  Icons.check,
                                  size: 24.0,
                                  color: Colors.black,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
