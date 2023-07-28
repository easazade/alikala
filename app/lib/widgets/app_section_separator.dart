import 'package:alikala/widgets/util/inner_shadow.dart';
import 'package:flutter/material.dart';

class AppSectionSeparator extends StatelessWidget {
  final double height;

  const AppSectionSeparator({this.height = 12});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 1,
      color: Colors.grey[300]!.withOpacity(0.6),
      offset: const Offset(1, 1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        height: height,
      ),
    );
  }
}
