import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';

class AppFailureWidget extends StatelessWidget {
  const AppFailureWidget({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      failure.message,
      style: TextStyle(color: theme.colorScheme.error),
    );
  }
}
