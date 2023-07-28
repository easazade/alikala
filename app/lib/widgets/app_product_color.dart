import 'package:alikala/data/entities.dart';
import 'package:flutter/material.dart';

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
            color: product.color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        SizedBox(width: 6),
        Text(product.colorName ?? '', style: TextStyle(fontSize: 11)),
      ],
    );
  }
}
