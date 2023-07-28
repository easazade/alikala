import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppAddToCart extends StatefulWidget {
  final Product product;
  final bool showSum;

  const AppAddToCart({required this.product, this.showSum = true});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AppAddToCart> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (_count == 0) {
              setState(() {
                _count++;
              });
            }
          },
          child: AnimatedContainer(
            width: 100,
            height: 40,
            duration: 0.15.seconds(),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: (_count == 0) ? theme.primaryColor : theme.colorScheme.onPrimary,
              border: Border.all(color: (_count == 0) ? theme.primaryColor : theme.colorScheme.onPrimary),
              borderRadius: BorderRadius.circular(8),
            ),
            child: (_count == 0)
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Buy',
                      style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onPrimary),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _count++;
                          });
                        },
                        child: Icon(Icons.add, size: 22, color: theme.primaryColor),
                      ),
                      Text('$_count',
                          style: TextStyle(color: theme.primaryColor, fontSize: 16, fontWeight: FontWeight.w700)),
                      GestureDetector(
                        onTap: () {
                          if (_count > 0) {
                            setState(() {
                              _count--;
                            });
                          }
                        },
                        child: Icon(
                          (_count == 1) ? FeatherIcons.trash2 : Icons.remove,
                          size: (_count == 1) ? 20 : 22,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        if (widget.showSum) ...[
          SizedBox(width: 10),
          Text((widget.product.price * _count).commaSeparated(), style: const TextStyle(fontWeight: FontWeight.w500)),
          Text('  \$', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500))
        ],
      ],
    );
  }
}
