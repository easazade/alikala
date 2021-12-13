import 'package:alikala/arcitecture/data/data.dart';
import 'package:alikala/arcitecture/store/store.dart';
import 'package:alikala/arcitecture/store/store_consumer.dart';
import 'package:flutter/material.dart';

typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, ReadableData<T> data);

class DataBuilder<T> extends StatelessWidget {
  const DataBuilder({
    Key? key,
    required this.data,
    required this.builder,
  }) : super(key: key);

  final ReadableData<T> data;

  final Widget Function(BuildContext context, ReadableData<T> data) builder;


  @override
  Widget build(BuildContext context) {
    return builder(context, data);
  }
}

class WhenDataBuilder<T> extends StatelessWidget {
  const WhenDataBuilder({
    Key? key,
    required this.data,
    required this.onAvailable,
    this.onNotAvailable,
    this.onLoading,
    this.onUpdate,
    this.onCreate,
    this.onDelete,
    this.onFetch,
    this.onError,
    this.orElse,
  }) : super(key: key);

  final ReadableData<T> data;


  final DataWidgetBuilder<T> onAvailable;
  final DataWidgetBuilder<T>? onNotAvailable;

  final DataWidgetBuilder<T>? onLoading;
  final DataWidgetBuilder<T>? onCreate;
  final DataWidgetBuilder<T>? onDelete;
  final DataWidgetBuilder<T>? onFetch;
  final DataWidgetBuilder<T>? onUpdate;

  final DataWidgetBuilder<T>? onError;
  final DataWidgetBuilder<T>? orElse;

  @override
  Widget build(BuildContext context) {
    if (data.isCreating && onCreate != null) {
      return onCreate!(context, data);
    }
    if (data.isDeleting && onDelete != null) {
      return onDelete!(context, data);
    }
    if (data.isFetching && onFetch != null) {
      return onFetch!(context, data);
    }
    if (data.isUpdating && onUpdate != null) {
      return onUpdate!(context, data);
    }
    if (data.isLoading && onLoading != null) {
      return onLoading!(context, data);
    }
    if (data.hasError && onError != null) {
      return onError!(context, data);
    }
    if (data.isAvailable) {
      return onAvailable(context, data);
    }
    if (data.isNotAvailable && onNotAvailable != null) {
      return onNotAvailable!(context, data);
    }
    return (orElse != null) ? orElse!(context, data) : Container();
  }
}
