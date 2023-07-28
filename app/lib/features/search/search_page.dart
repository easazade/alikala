import 'package:alikala/core/constants.dart';
import 'package:alikala/generated/l10n.dart';
import 'package:alikala/widgets/app_search_item.dart';
import 'package:alikala/widgets/util/no_scroll_glow.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SearchPage> {
  final _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        titleSpacing: 0,
        title: TextField(
          focusNode: _focusNode,
          autofocus: true,
          controller: _textEditingController,
          style: const TextStyle(color: AppColors.textDark, fontSize: 17, fontWeight: FontWeight.w500),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
            border: InputBorder.none,
            hintText: S.of(context).search,
            hintStyle: const TextStyle(color: AppColors.textLight, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _textEditingController.clear();
              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FeatherIcons.xSquare),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(width: MediaQuery.of(context).size.width, color: AppColors.themeAccent2, height: 1),
            NoScrollIndicator(
              child: Expanded(
                child: ListView(
                  children: [
                    AppSearchItem(resultTitle: 'Apple Airpod pro', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'Beats Headset C105', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                    AppSearchItem(resultTitle: 'D12 Blazer', resultLocation: 'In Headphones'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
