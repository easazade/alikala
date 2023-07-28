import 'package:alikala/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'slider/app_slider_dot_indicator.dart';

class AppSliverSliders extends StatefulWidget {
  final List<String> images;

  const AppSliverSliders({required this.images});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AppSliverSliders> {
  int _selectedPosition = 0;

  List<Widget> imageSliders(BuildContext context) => widget.images
      .map(
        (item) => Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: item,
                fit: BoxFit.cover,
                placeholder: (_, __) => Image.asset(Assets.images.imagePlaceholder.path, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      // ignore: avoid_unnecessary_containers
      child: Container(
          child: Column(
        children: <Widget>[
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.8, //this changes height of the slider items
                  enlargeCenterPage: false,
                  viewportFraction: 0.9, //decrease to show part of next and previous image beside current slide
                  onPageChanged: (position, reason) {
                    setState(() {
                      _selectedPosition = position;
                    });
                  },
                ),
                items: imageSliders(context),
              ),
              Positioned(
                bottom: 15,
                left: 40,
                child: AppCarouselDotIndicator(_selectedPosition, widget.images.length),
              )
            ],
          ),
        ],
      )),
    );
  }
}
