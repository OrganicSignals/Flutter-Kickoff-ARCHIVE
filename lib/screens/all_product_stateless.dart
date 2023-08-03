import 'package:flutter/material.dart';
import 'package:udemytest/data/dummy_data.dart';
import 'package:udemytest/models/bag.dart';

class AllProductsStateless extends StatelessWidget {
  AllProductsStateless({super.key, required this.bag});

  final Bag bag;

  //List<Bag> bags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: dummyBags.length,
                itemBuilder: ((context, index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                height: 100,
                                width: 100,
                                //image: AssetImage(productImages[index].toString()
                                //)
                                image: AssetImage(bag.imageUrl),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(bag.bagName),
                                  SizedBox(height: 5),
                                  Text("\₹${bag.price}"),
                                ],
                              )
                            ],
                          ),
                        ]),
                  ));
                })))
      ]),
    );
  }
}
