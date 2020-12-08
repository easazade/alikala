import 'package:alikala/core/constants.dart';
import 'package:flutter/material.dart';

class AppRating extends StatelessWidget {
  final int votes;
  final int points;

  const AppRating({Key key, @required this.points, @required this.votes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maxPoints = votes * 5;
    double percentage = points / maxPoints;
    var hasFirstStar = percentage >= 0.15;
    var hasSecondStar = percentage >= 0.35;
    var hasThirdStar = percentage >= 0.55;
    var hasFourthStar = percentage >= 0.70;
    var hasFifthStar = percentage >= 0.90;
    print(points);
    print(maxPoints);
    print(percentage);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: (hasFirstStar) ? AppColors.YELLOW_STAR : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasSecondStar) ? AppColors.YELLOW_STAR : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasThirdStar) ? AppColors.YELLOW_STAR : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasFourthStar) ? AppColors.YELLOW_STAR : Colors.grey[300], size: 18),
          Icon(Icons.star, color: (hasFifthStar) ? AppColors.YELLOW_STAR : Colors.grey[300], size: 18),
          SizedBox(width: 8),
          Text('($votes)'),
        ],
      ),
    );
  }
}
