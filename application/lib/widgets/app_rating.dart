import 'package:application/core/constants.dart';
import 'package:flutter/material.dart';

class AppRating extends StatelessWidget {
  final int votes;
  final int points;

  const AppRating({required this.points, required this.votes}) : super();

  @override
  Widget build(BuildContext context) {
    var maxPoints = votes * 5;
    double percentage = points / maxPoints;
    var hasFirstStar = percentage >= 0.15;
    var hasSecondStar = percentage >= 0.35;
    var hasThirdStar = percentage >= 0.55;
    var hasFourthStar = percentage >= 0.70;
    var hasFifthStar = percentage >= 0.90;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: (hasFirstStar) ? AppColors.yellowStar : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasSecondStar) ? AppColors.yellowStar : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasThirdStar) ? AppColors.yellowStar : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasFourthStar) ? AppColors.yellowStar : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasFifthStar) ? AppColors.yellowStar : Colors.grey[300], size: 18),
          SizedBox(width: 8),
          Text('($votes)'),
        ],
      ),
    );
  }
}
