import 'package:alikala/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSearchItem extends StatelessWidget {
  final String resultTitle;
  final String resultLocation;

  const AppSearchItem({required this.resultTitle, required this.resultLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        height: 46,
        child: Row(
          children: [
            SizedBox(height: 46, width: 36, child: Icon(CupertinoIcons.search, color: Colors.grey[500])),
            Padding(padding: const EdgeInsets.all(4)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(resultTitle, style: TextStyles.dark_14_w500),
                Text(resultLocation, style: TextStyles.light_12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
