import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSliverHorizontalCommentsList extends StatelessWidget {
  final List<Comment> comments;
  final String title;
  final String linkLabel;
  final VoidCallback onLinkClicked;

  const AppSliverHorizontalCommentsList({
    required this.comments,
    required this.title,
    required this.linkLabel,
    required this.onLinkClicked,
  }) : super();

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
    required this.comments,
    required this.title,
    required this.linkLabel,
    required this.onLinkClicked,
  }) : super();

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
                    onPressed: onLinkClicked,
                    child: Row(
                      children: [
                        Text(
                          linkLabel,
                          style: TextStyle(fontSize: 13, color: AppColors.themeAccent2, fontWeight: FontWeight.w500),
                        ),
                        Icon(CupertinoIcons.forward, color: AppColors.themeAccent2, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemBuilder: (context, position) => _createCommentItem(context, comments[position]),
                itemCount: comments.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createCommentItem(BuildContext context, Comment comment) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 230,
      height: 230,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey[300]!, spreadRadius: 0.5, blurRadius: 0.5)],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.title, style: textTheme.labelMedium),
          SizedBox(height: 4),
          Expanded(
            child: Text(comment.content, style: textTheme.labelSmall, maxLines: 5, overflow: TextOverflow.ellipsis),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(comment.dateTime.toString(), style: textTheme.labelSmall),
              SizedBox(width: 5),
              Icon(Icons.circle, size: 5, color: Colors.grey[300]),
              SizedBox(width: 5),
              Text(comment.username, style: textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
