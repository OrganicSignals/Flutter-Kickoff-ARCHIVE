import 'package:flutter/material.dart';

class BagItemTrait extends StatelessWidget {
  const BagItemTrait({super.key, required this.icon, required this.lable});

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(
          lable,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
