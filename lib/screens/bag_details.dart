import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/util/db_helper.dart';

class BagDetailsScreesn extends StatelessWidget {
  const BagDetailsScreesn({
    super.key,
    required this.bag,
    required this.onToggleCart,
  });
  final Bag bag;
  final void Function(Bag bag) onToggleCart;

  //final int numOfCartItem;

  @override
  Widget build(BuildContext context) {
    DBHelper dbhelp = DBHelper();
    //final cart = Provider.of<cartProvider>(context);
    //context.read<cartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bag.bagName,
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //This cart button working ok but counter is not displayed
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       onToggleCart(bag);
        //     },
        //     icon: Icon(Icons.shopping_cart),
        //     iconSize: 29,
        //     color: Colors.white,
        //     alignment: Alignment.center,
        //   )
        // ],
// this button shows 0 counter initially but doesent work properly
        actions: [
          InkWell(
            // onTap: (() {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => CartScreen()));
            // }),
            child: Center(
              child: Badge(
                badgeContent: Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],

        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
          ),

          Image.asset(
            bag.imageUrl,
            height: 200,
            width: 2500.0,
            //fit: BoxFit.cover,
          ),
          // Image.asset(bag.imageUrl),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Material',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.left,
          ),
          for (final material in bag.material)
            Text(
              material,
              style: TextStyle(fontSize: 19, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Description :',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.left,
          ),
          for (final desription in bag.description)
            Text(
              desription,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 19, color: Colors.black),
            ),

          const SizedBox(
            height: 14,
          ),
          const Text(
            'Price',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.left,
          ),

          // for (final bag in bag.price)
          Text(
            "\₹${bag.price}",
            //price,
            style: TextStyle(fontSize: 19, color: Colors.black),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
            //width: double.infinity,
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: double.infinity,
          //       child: Center(child: const CartCounter()),
          //     ),
          //   ],
          // ),
          SizedBox(height: 10),
          // AddToCart(
          //   bag: bag,
          //   //onToggleCart: (Bag bag) {},
          // ),
          SizedBox(
            //height: 60,
            //width: double.infinity,
            child: TextButton(
              // style: ButtonStyle(
              //   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),

              // ),
              style: TextButton.styleFrom(
                fixedSize: const Size(double.infinity, 60),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                // dbhelp
                //     .insert(Cart(
                //         id: int.parse(bag.id.toString()),
                //         productId: bag.id,
                //         productName: bag.bagName,
                //         price: bag.price,
                //         quantity: 1,
                //         img: bag.imageUrl))
                //     .then((value) {
                //   print("Added to cart");
                //   //cart.addTotalPrice(double.parse(bag.price.toString()));

                //   //cart.addCounter();
                // }).onError((error, stackTrace) {
                //   print(error.toString());
                // });
                onToggleCart(bag);
                //cartBagProvider;
              },
              child: Text('Add To Cart'),
            ),
//                }
          ),
          // ElevatedButton(onPressed: () {}, child: Text("Add cart"))
        ],
      ),
      //bottomNavigationBar: TabScreen(),
    );
  }
}
