import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/widgets/bag_item_trait.dart';

class BagItem extends StatelessWidget {
  const BagItem({super.key, required this.bag, required this.onSelectBag});

  final Bag bag;

  final void Function(BuildContext context, Bag bag) onSelectBag;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectBag(context, bag);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(bag.imageUrl),
              fit: BoxFit.cover,
              height: 150,
              width: double.minPositive,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                child: Column(children: [
                  Text(
                    bag.bagName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[150]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      BagItemTrait(
                          icon: Icons.work, lable: bag.look.toString()),
                      BagItemTrait(
                          icon: Icons.currency_rupee,
                          lable: bag.price.toString()),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
