import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, required this.failure});

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
