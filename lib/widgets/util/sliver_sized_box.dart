import 'package:flutter/material.dart';

class SliverSizedBox extends StatelessWidget {
  final double height;
  final double width;

  const SliverSizedBox({this.height = 0, this.width = 0}) : super();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(height: height, width: width),
    );
  }
}
