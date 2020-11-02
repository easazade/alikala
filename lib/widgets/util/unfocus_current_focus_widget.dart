import 'package:alikala/utils/utils_functions.dart';
import 'package:flutter/material.dart';

class UnFocusCurrentFocusWidget extends StatelessWidget {
  final Widget child;

  UnFocusCurrentFocusWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusCurrentFocus(context),
      onTapDown: (_) => unFocusCurrentFocus(context),
      onPanDown: (_)=> unFocusCurrentFocus(context),
      child: child,
    );
  }
}
