import 'package:flutter/material.dart';

class RemoveFocusOnTouchOutsideFocusedWidget extends StatelessWidget {
  final Widget child;

  RemoveFocusOnTouchOutsideFocusedWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusCurrentFocus(context),
      onTapDown: (_) => unFocusCurrentFocus(context),
      onPanDown: (_)=> unFocusCurrentFocus(context),
      child: child,
    );
  }

  void unFocusCurrentFocus(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.requestFocus(FocusNode());
    }
  }
}
