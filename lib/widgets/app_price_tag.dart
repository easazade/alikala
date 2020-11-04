import 'package:alikala/core/constants.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:flutter/material.dart';

class AppPriceTag extends StatelessWidget {
  final int price;
  final double sizeFactor;
  final Color color;

  AppPriceTag(this.price, {this.sizeFactor = 1, this.color = AppColors.TEXT_DARK});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${price.commaSeparated()}',
          style: TextStyle(fontSize: 14 * sizeFactor, color: color, fontWeight: FontWeight.w500),
        ),
        Text('  تومان', style: TextStyle(fontSize: 8 * sizeFactor, color: color, fontWeight: FontWeight.w500))
      ],
    );
  }
}
