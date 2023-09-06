import 'package:flutter/material.dart';

class Unfocus extends StatelessWidget {
  final Widget child;

  const Unfocus({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusCurrentFocus(context),
      onTapDown: (_) => unFocusCurrentFocus(context),
      onPanDown: (_) => unFocusCurrentFocus(context),
      child: child,
    );
  }

  void unFocusCurrentFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.requestFocus(FocusNode());
    }
  }
}
