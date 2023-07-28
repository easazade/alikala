import 'package:alikala/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

class AppSliverDoubleBanner extends StatelessWidget {
  final List<String> imageUrls;

  const AppSliverDoubleBanner({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    var calculatedWidth = (MediaQuery.of(context).size.width) / 2 * 0.9;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var image in imageUrls.take(2))
              SizedBox(
                height: 120,
                width: calculatedWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AppNetworkImage(imageUrl: image),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
