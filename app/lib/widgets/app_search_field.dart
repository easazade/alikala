import 'package:alikala/core/constants.dart';
import 'package:alikala/utils/typedefs.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:alikala/utils/utils_functions.dart';

class AppSearchField extends StatefulWidget {
  final String hint;
  final StringCallback onSearchBtnClicked;
  final VoidCallback onSearchFieldCleared;

  const AppSearchField({required this.hint, required this.onSearchBtnClicked, required this.onSearchFieldCleared});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AppSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (str) {
                  widget.onSearchBtnClicked(_controller.text);
                  FocusScope.of(context).unfocus();
                },
                maxLines: 1,
                style: TextStyle(fontSize: 14),
                onChanged: (input) {
                  if (input.isNullOrBlank) {
                    widget.onSearchFieldCleared();
                  }
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: TextStyle(color: AppColors.textLight, fontSize: 14),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            widget.onSearchBtnClicked(_controller.text);
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            height: 35,
            width: 35,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 5),
                color: theme.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2.0, right: 1.0),
                child: Icon(FeatherIcons.search, size: 14, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
