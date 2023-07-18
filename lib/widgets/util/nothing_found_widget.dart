import 'package:alikala/generated/l10n.dart';
import 'package:flutter/material.dart';

class NothingFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(S.of(context).couldNotFindAnything, style: TextStyle(fontSize: 16)),
    );
  }
}
