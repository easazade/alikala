import 'package:alikala/core/constants.dart';
import 'package:alikala/utils/typedefs.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String hint;
  final StringCallback onChange;

  AppFormField(this.hint, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          textInputAction: TextInputAction.search,
          maxLines: 1,
          style: TextStyle(fontSize: 14),
          onChanged: (input) {
            if (!input.isNullOrBlank) {
              onChange(input);
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.TEXT_LIGHT_3, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
