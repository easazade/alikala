import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSliverHorizontalCommentsList extends StatelessWidget {
  final List<Comment> comments;
  final String title;
  final String linkLabel;
  final VoidCallback onLinkClicked;

  const AppSliverHorizontalCommentsList({
    Key key,
    @required this.comments,
    @required this.title,
    @required this.linkLabel,
    @required this.onLinkClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppHorizontalCommentsList(
        comments: comments,
        title: title,
        linkLabel: linkLabel,
        onLinkClicked: onLinkClicked,
      ),
    );
  }
}

class AppHorizontalCommentsList extends StatelessWidget {
  final List<Comment> comments;
  final String title;
  final String linkLabel;
  final VoidCallback onLinkClicked;

  const AppHorizontalCommentsList({
    Key key,
    @required this.comments,
    @required this.title,
    @required this.linkLabel,
    @required this.onLinkClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) => true,
      child: Container(
        height: 230,
        margin: const EdgeInsets.only(top: 20, bottom: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  TextButton(
                    child: Row(
                      children: [
                        Text(
                          linkLabel,
                          style: TextStyle(fontSize: 13, color: AppColors.THEME_ACCENT_2, fontWeight: FontWeight.w500),
                        ),
                        Icon(CupertinoIcons.forward, color: AppColors.THEME_ACCENT_2, size: 18),
                      ],
                    ),
                    onPressed: onLinkClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemBuilder: (context, position) => _createCommentItem(comments[position]),
                itemCount: comments.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createCommentItem(Comment comment) {
    return Container(
      width: 230,
      height: 230,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: 0.5, blurRadius: 0.5)],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.title, style: TextStyles.dark_14_w500),
          SizedBox(height: 4),
          Expanded(
            child: Text(comment.content, style: TextStyles.dark_12, maxLines: 5, overflow: TextOverflow.ellipsis),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(comment.dateTime.jalaliWeekDayRelative, style: TextStyles.light_12),
              SizedBox(width: 5),
              Icon(Icons.circle, size: 5, color: Colors.grey[300]),
              SizedBox(width: 5),
              Text(comment.username, style: TextStyles.light_12),
            ],
          ),
        ],
      ),
    );
  }
}
