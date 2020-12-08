import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'app_slider_dot_indicator.dart';

class AppImageCarousel<T> extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) builder;
  final double height;
  final double viewport;
  final double aspectRatio;
  List<int> _indexes;

  AppImageCarousel(
    this.itemCount, {
    @required this.height,
    @required this.builder,
    this.viewport = 1.2,
    this.aspectRatio = 2,
  }) {
    _indexes = List<int>();
    for (int i = 0; i < itemCount; i++) {
      _indexes.add(i);
    }
  }

  @override
  State<StatefulWidget> createState() => _AppImageCarouselState();
}

class _AppImageCarouselState extends State<AppImageCarousel> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            items: widget._indexes.map((i) => widget.builder(context, i)).toList(),
            options: CarouselOptions(
              height: widget.height ?? 200,
              enableInfiniteScroll: true,
              autoPlay: (widget.itemCount > 1) ? true : false,
              autoPlayInterval: const Duration(seconds: 6),
              pauseAutoPlayOnTouch: true,
              aspectRatio: widget.aspectRatio,
              enlargeCenterPage: false,
              viewportFraction: widget.viewport,
              onPageChanged: (index, reason) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 30,
          child: AppCarouselDotIndicator(_selectedIndex, widget.itemCount),
        )
      ],
    );
  }
}
