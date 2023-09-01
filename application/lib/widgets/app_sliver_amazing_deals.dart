import 'package:application/core/constants.dart';
import 'package:application/data/entities.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:application/widgets/app_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSliverAmazingDeals extends StatefulWidget {
  final List<AmazingDeal> amazingDeals;

  const AppSliverAmazingDeals({required this.amazingDeals});

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
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: theme.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                _createSeeAllAmazingDealsWidget(),
                for (var deal in widget.amazingDeals) _createAmazingDealWidget(context, deal),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createSeeAllAmazingDealsWidget() {
    return SizedBox(
      width: 130,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TODO: rewrite this with RichText
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pretty', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
              Text('Amazing', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
              Text('Offers', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
            ],
          ),
          Row(
            children: [
              Text('View All', style: TextStyle(color: Colors.white)),
              Icon(CupertinoIcons.forward, color: Colors.white)
            ],
          ),
        ],
      ),
    );
  }

  Widget _createAmazingDealWidget(BuildContext context, AmazingDeal deal) {
    final theme = Theme.of(context);

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
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('${deal.offPercentage.toInt()}%', style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(deal.offPrice.commaSeparated(),
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          SizedBox(width: 2),
                          Text('\$', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Text(
                        deal.price.commaSeparated(),
                        style: TextStyle(
                          color: AppColors.textLight,
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
                style: TextStyle(fontSize: 11, color: AppColors.textLight),
              );
            },
          ),
        ),
      ],
    );
  }
}
