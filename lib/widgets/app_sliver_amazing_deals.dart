import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSliverAmazingDeals extends StatefulWidget {
  final List<AmazingDeal> amazingDeals;

  AppSliverAmazingDeals({@required this.amazingDeals});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AppSliverAmazingDeals> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future.delayed(1.seconds(), () async {
      while (true) {
        await 1.secondsDelay();
        setState(() {
          now = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: AppColors.THEME_ACCENT,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                _createSeeAllAmazingDealsWidget(),
                for (var deal in widget.amazingDeals) _createAmazingDealWidget(deal),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createSeeAllAmazingDealsWidget() {
    return Container(
      width: 130,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('پیشنهاد', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
              Text('شگفت', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
              Text('انگیز', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
            ],
          ),
          Row(
            children: [
              Text('مشاهده همه', style: TextStyle(color: Colors.white)),
              Icon(CupertinoIcons.forward, color: Colors.white)
            ],
          ),
        ],
      ),
    );
  }

  Widget _createAmazingDealWidget(AmazingDeal deal) {
    return Stack(
      children: [
        Container(
          width: 160,
          height: 280,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              AppNetworkImage(imageUrl: deal.images.firstOrNull, width: 120, height: 80),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deal.title,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //off percentage
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.THEME_ACCENT,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('${deal.offPercentage.toInt()}%', style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${deal.offPrice.commaSeparated()}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          SizedBox(width: 2),
                          Text('تومان', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Text(
                        '${deal.price.commaSeparated()}',
                        style: TextStyle(
                          color: AppColors.TEXT_LIGHT,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          left: 15,
          child: Builder(
            builder: (context) {
              Duration difference = deal.dueDate.difference(now);
              String remaining = difference.toString().split('.')[0];
              return Text(
                remaining,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 11, color: AppColors.TEXT_LIGHT),
              );
            },
          ),
        ),
      ],
    );
  }
}
