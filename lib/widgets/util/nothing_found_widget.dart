import 'package:flutter/material.dart';

class NothingFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('هیچ موردی یافت نشد !', style: TextStyle(fontSize: 16)),
    );
  }
}
