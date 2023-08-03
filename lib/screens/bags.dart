import 'package:flutter/material.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/screens/bag_details.dart';
import 'package:udemytest/widgets/bag_item.dart';

class BagsScreen extends StatelessWidget {
  const BagsScreen(
      {super.key, this.title, required this.bags, required this.onToggleCart});
  final String? title;
  final List<Bag> bags;
  final void Function(Bag bag) onToggleCart;

  //get bag => bag;
  void selectBag(BuildContext context, Bag bag) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BagDetailsScreesn(
        bag: bag,
        onToggleCart: onToggleCart,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: bags.length,
        itemBuilder: ((context, index) => BagItem(
              bag: bags[index],
              onSelectBag: selectBag,
            )));

    if (bags.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Text('No bag Found,Please try another category')],
        ),
      );
    }

    if (bags.isNotEmpty) {
      ListView.builder(
          itemCount: bags.length,
          itemBuilder: ((context, index) => BagItem(
                bag: bags[index],
                onSelectBag: selectBag,
              )));
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: content,

      //       Column(children: [
      //     Expanded(
      //         child: ListView.builder(
      //             itemCount: bags.length,
      //             itemBuilder: ((context, index) {
      //               return Card(
      //                   child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     mainAxisSize: MainAxisSize.max,
      //                     children: [
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Image(
      //                             height: 100,
      //                             width: 100,
      //                             image: AssetImage(bags[index].imageUrl),
      //                             // productImages[index].toString())
      //                           ),
      //                           SizedBox(
      //                             width: 20,
      //                           ),
      //                           Expanded(
      //                             child: Column(
      //                                 mainAxisAlignment: MainAxisAlignment.start,
      //                                 crossAxisAlignment:
      //                                     CrossAxisAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     bags[index].bagName,
      //                                     // productName[index].toString(),
      //                                     style: TextStyle(
      //                                         fontSize: 16,
      //                                         fontWeight: FontWeight.bold),
      //                                   ),
      //                                   SizedBox(
      //                                     height: 5,
      //                                   ),
      //                                   Text(
      //                                     "₹" +
      //                                         " " +
      //                                         bags[index].price.toString(),
      //                                     //productPrice[index].toString(),
      //                                     style: TextStyle(
      //                                         fontSize: 16,
      //                                         fontWeight: FontWeight.bold),
      //                                   ),
      //                                   // onTap:() {bag:
      //                                   //       bags[index];
      //                                   //       onSelectBag:
      //                                   //       selectBag;
      //                                   //       onToggleCart:
      //                                   //       onToggleCart;

      //                                   // SizedBox(
      //                                   //   height: 5,
      //                                   // ),
      //                                   Align(
      //                                     alignment: Alignment.centerRight,
      //                                     child: InkWell(
      //                                       onTap: (() {
      //                                         // dbhelp
      //                                         //     .insert(cart(productId: index.toString(),
      //                                         //         productName:
      //                                         //             productName[index]
      //                                         //                 .toString(),
      //                                         //         price: productPrice[index]
      //                                         //             .toString(),
      //                                         //         quantity: 1,
      //                                         //         image: productImages[index]
      //                                         //             .toString()))
      //                                         //     .then((value) {
      //                                         //   print("Added to cart");
      //                                         //   //cart.addTotalPrice(double.parse(productPrice[index].toString()));
      //                                         //   //cart.addCounter();
      //                                         // }).onError((error, stackTrace) {
      //                                         //   print(error.toString());
      //                                         // });
      //                                         BagDetailsScreesn(
      //                                             bag: bag,
      //                                             onToggleCart: onToggleCart);
      //                                       }),
      //                                       child: Container(
      //                                         height: 40,
      //                                         width: 100,
      //                                         decoration: BoxDecoration(
      //                                             color: Colors.blue,
      //                                             borderRadius:
      //                                                 BorderRadius.circular(7)),
      //                                         child: Center(
      //                                           child: Text("Add To Cart"),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   SizedBox(height: 10)
      //                                 ]),
      //                           ),
      //                         ],
      //                       ),
      //                     ]),
      //               ));
      //             })))
      //   ]),
    );
  }
}
