import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_sliver_sliders.dart';
import 'package:alikala/widgets/app_sliver_search_bar.dart';
import 'package:flutter/material.dart';

import '../../fake_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverSearchBar(context, () {
            showInfoToast('Information');
          }),
          AppSliverSliders(images: fakeSales),
        ],
      ),
    );
  }
}
