import 'package:alikala/arcitecture/store/store.dart';
import 'package:flutter/material.dart';

class StoreConsumer<T extends Store> extends StatefulWidget {
  final T? store;
  final T Function(BuildContext context)? lazyStore;
  final void Function(BuildContext context, T store)? listener;
  final Widget Function(BuildContext context, T store) builder;

  const StoreConsumer.create({
    Key? key,
    required T Function(BuildContext context) create,
    required this.builder,
    this.listener,
  })  : store = null,
        lazyStore = create,
        super(key: key);

  const StoreConsumer.value({
    Key? key,
    required T value,
    required this.builder,
    this.listener,
  })  : store = value,
        lazyStore = null,
        super(key: key);

  @override
  State<StoreConsumer<T>> createState() => _State<T>();
}

class _State<T extends Store> extends State<StoreConsumer<T>> {
  late void Function() _listener;

  late T _store;

  @override
  void initState() {
    _store = widget.store ?? widget.lazyStore!.call(context);
    _listener = () => setState(() {});
    _store.addListener(_listener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.listener?.call(context, _store);
    return widget.builder(context, _store);
  }

  @override
  void dispose() {
    _store.removeListener(_listener);
    super.dispose();
  }
}
