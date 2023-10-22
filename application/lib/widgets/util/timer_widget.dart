import 'dart:async';

import 'package:flutter/material.dart';

/// A Widget that rebuilds based on given interval periods
class TimerBuilder extends StatefulWidget {
  const TimerBuilder({
    super.key,
    required this.period,
    required this.builder,
  });

  final Duration period;
  final WidgetBuilder builder;

  @override
  State<TimerBuilder> createState() => _TimerBuilderState();
}

class _TimerBuilderState extends State<TimerBuilder> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  void didUpdateWidget(covariant TimerBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.period != widget.period) {
      timer.cancel();
      _initTimer();
    }
  }

  void _initTimer() {
    timer = Timer.periodic(
      widget.period,
      (timer) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) => widget.builder(context);
}
