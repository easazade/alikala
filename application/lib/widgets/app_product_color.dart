import 'package:flutter/material.dart';
import 'package:shop_client/shop_client.dart';

class AppProductColor extends StatelessWidget {
  final Product product;

  const AppProductColor(this.product);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        SizedBox(width: 6),
        Text('red', style: TextStyle(fontSize: 11)),
      ],
    );
  }
}
