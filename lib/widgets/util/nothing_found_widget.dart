import 'package:flutter/material.dart';

class NothingFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Could not Find anything', style: TextStyle(fontSize: 16)),
    );
  }
}
