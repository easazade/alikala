import 'package:alikala/widgets/app_sliver_search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverSearchBar(context),
        ],
      ),
    );
  }
}
