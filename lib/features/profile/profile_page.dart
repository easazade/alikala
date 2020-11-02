import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(child: Text('ProfilePage'), onPressed: () {
            sailor.navigate(Routes.VERIFY_CODE);
          }),
        ),
      ),
    );
  }
}
