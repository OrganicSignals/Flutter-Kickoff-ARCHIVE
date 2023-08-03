import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 15.0),
        CarouselSlider(
          items: [
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/slider/electronics.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/slider/untitled.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/slider/lifestyle.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],

          options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              autoPlayAnimationDuration: const Duration(seconds: 4)),
          // ),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
