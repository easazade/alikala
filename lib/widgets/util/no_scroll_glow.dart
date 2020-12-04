import 'package:flutter/material.dart';

class NoScrollGlow extends StatelessWidget {
  final Widget child;

  NoScrollGlow({this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: child,
    );
  }
}
