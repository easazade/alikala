import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppAddToCart extends StatelessWidget {
  final Product product;
  final int count;

  AppAddToCart({@required this.product, @required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.add, size: 22, color: AppColors.THEME_ACCENT),
              SizedBox(width: 12),
              Text('$count', style: TextStyle(color: AppColors.THEME_ACCENT, fontSize: 16, fontWeight: FontWeight.w700)),
              SizedBox(width: 12),
              Icon(
                (count == 1) ? FeatherIcons.trash2 : Icons.remove,
                size: (count == 1) ? 20 : 22,
                color: AppColors.THEME_ACCENT,
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Text('${(product.price * count).commaSeparated()}', style: TextStyle(fontWeight: FontWeight.w500)),
        Text('  تومان', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500))
      ],
    );
  }
}
