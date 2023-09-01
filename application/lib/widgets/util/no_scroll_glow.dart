import 'package:flutter/material.dart';

class NoScrollIndicator extends StatelessWidget {
  final Widget child;

  const NoScrollIndicator({required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: child,
    );
  }
}
