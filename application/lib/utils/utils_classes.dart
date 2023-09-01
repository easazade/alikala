import 'dart:collection';
import 'package:flutter/material.dart';

class StackCollection<T> {
  final _stack = Queue<T>();

  int get length => _stack.length;

  bool canPop() => _stack.isNotEmpty;

  void clearStack() {
    while (_stack.isNotEmpty) {
      _stack.removeLast();
    }
  }

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  T peak() => _stack.last;
}

Widget divider(BuildContext context, {EdgeInsetsGeometry? padding}) {
  return Padding(
    padding: padding ?? const EdgeInsets.all(0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 1.3,
      color: Colors.grey[200],
    ),
  );
}
