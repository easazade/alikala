import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alikala/core/constants.dart';

class AppToolbar extends StatelessWidget {
  final String? title;

  const AppToolbar(this.title);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                  child: Icon(CupertinoIcons.back, color: Colors.black),
                ),
              ),
              if (title != null)
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    title!,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
