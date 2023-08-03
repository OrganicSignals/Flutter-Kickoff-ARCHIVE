import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemytest/data/dummy_data.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/models/cart.dart';
import 'package:udemytest/providers/cart_provider_test.dart';
import 'package:udemytest/screens/bag_details.dart';
import 'package:udemytest/util/db_helper.dart';

//import 'package:udemytest/models/bag.dart';//
//import 'package:udemytest/providers/bags_provider.dart';
//import 'package:udemytest/providers/bags_provider.dart';

// ignore: must_be_immutable
class AllProductScreen extends StatefulWidget {
  AllProductScreen({
    super.key,
    required this.onToggleCart,
    //required this.bag,
  });

  //final Bag bag;

  final void Function(Bag bag) onToggleCart;

  get bag => bag;
  void selectBag(BuildContext context, Bag bag) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BagDetailsScreesn(
        bag: bag,
        onToggleCart: onToggleCart,
      ),
    ));
  }

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  DBHelper dbhelp = DBHelper();

// product images.later on we need to fetch these from dB
  List<String> productImages = [
    "assets/bags/maroonWaraliSling.jpg",
    "assets/bags/ikkatSunshine.jpg",
    "assets/bags/ikkatPrintPurse.jpg",
    "assets/bags/travelPouch.jpg",
    "assets/bags/travelPouchLong.jpg",
    "assets/bags/ikkatPurse.jpg",
    "assets/bags/vanity pouch.jpg",
    "assets/bags/travelPouchMediumPolkaDot.jpg",
    "assets/bags/ashySling.jpg",
    "assets/bags/blueSling.jpg",
  ];
  late Bag bag;
  //List<double> bagprice = bag.price;

  List<double> productPrice = [
    250.0,
    350.0,
    170.00,
    350.00,
    370.00,
    350.00,
    350.0,
    350.0,
    300.00,
    270.00
  ];
  List<String> productName = [
    'Maroon Sling',
    'Ikkat-Sunshine Bag',
    'Ikkat Print Purse',
    'Travel Pouch Medium',
    'Travel Pouch Long',
    'Ikkat Print Purse',
    'Travel Pouch Medium',
    'Travel Pouch Medium',
    'merlin sling',
    'ashy prinia sling',
  ];

  get selectBag => selectBag;

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<cartProvider>(context);
    //final cart = Provider.of<cartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Center(
              child: Badge(
                showBadge: true,
                badgeContent: Consumer<cartProvider>(
                  builder: (context, value, child) {
                    return Text(value.getCounter().toString(),
                        style: TextStyle(color: Colors.white));
                  },
                ),
                animationType: BadgeAnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
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
                                  image: AssetImage(
                                      productImages[index].toString())),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productName[index].toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "₹" +
                                            " " +
                                            productPrice[index].toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: (() {
                                            dbhelp
                                                .insert(Cart(
                                                    id: index,
                                                    productId: index.toString(),
                                                    productName:
                                                        productName[index]
                                                            .toString(),
                                                    price: productPrice[index]
                                                        .toDouble(),
                                                    quantity: 1,
                                                    img: productImages[index]
                                                        .toString()))
                                                .then((value) {
                                              print("Added to cart");
                                              // cart.addTotalPrice(double.parse(productPrice[index].toString()));

                                              //cart.addCounter();
                                            }).onError((error, stackTrace) {
                                              print(error.toString());
                                            });
                                          }),
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: Center(
                                              child: Text("Add To Cart"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10)
                                    ]),
                              ),
                            ],
                          ),
                        ]),
                  ));
                })))
      ]),
    );
  }
}
