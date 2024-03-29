import 'package:application/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

class AppSliverSingleBanner extends StatelessWidget {
  final String? imageUrl;

  const AppSliverSingleBanner({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: AppNetworkImage(imageUrl: imageUrl ?? ''),
        ),
      ),
    );
  }
}
