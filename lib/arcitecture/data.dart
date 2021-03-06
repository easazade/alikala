import 'package:alikala/arcitecture/builders.dart';
import 'package:alikala/arcitecture/exceptions.dart';
import 'package:alikala/arcitecture/store_consumer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum Operation { loading, update, delete, fetch, create, none }

abstract class ReadOnlyData<T> implements ReadableData<T>, BuildableData<T> {}

abstract class ReadableData<T> {
  T get value;

  DataError get error;

  DataError get consumeError;

  bool get isAvailable;

  bool get isNotAvailable;

  bool get isLoading;

  bool get isUpdating;

  bool get isDeleting;

  bool get isFetching;

  bool get isCreating;

  bool get hasError;

  bool valueEqualsTo(T? another);
}

abstract class BuildableData<T> {
  Widget build(final DataWidgetBuilder<T> builder);

  Widget buildWhen({
    required DataWidgetBuilder<T> onAvailable,
    DataWidgetBuilder<T>? onNotAvailable,
    DataWidgetBuilder<T>? onLoading,
    DataWidgetBuilder<T>? onCreate,
    DataWidgetBuilder<T>? onDelete,
    DataWidgetBuilder<T>? onFetch,
    DataWidgetBuilder<T>? onUpdate,
    DataWidgetBuilder<T>? onError,
    DataWidgetBuilder<T>? orElse,
  });
}

abstract class EditableData<T> {
  void setValue(T? value);

  void setOperation(Operation operation);

  void setError(DataError? error);
}

class DataError {
  const DataError(this.message, this.exception);

  final String message;

  final Exception exception;

  @override
  String toString() {
    return '${super.toString()}\n$message\n';
  }
}

class Data<T> with EquatableMixin implements ReadOnlyData<T>, EditableData<T> {
  T? _value;
  DataError? _error;
  Operation _operation = Operation.none;

  @override
  T get value {
    if (_value == null) {
      throw ValueNotAvailableException();
    }
    return _value!;
  }

  @override
  DataError get consumeError {
    if (_error == null) {
      throw DataErrorIsNullException();
    }
    DataError consumedErrorValue = _error!;
    _error = null;
    return consumedErrorValue;
  }

  @override
  DataError get error {
    if (_error == null) {
      throw DataErrorIsNullException();
    }
    return _error!;
  }

  @override
  bool get hasError => _error != null;

  @override
  bool get isAvailable => _value != null;

  @override
  bool get isNotAvailable => !isAvailable;

  @override
  bool get isCreating => _operation == Operation.create;

  @override
  bool get isDeleting => _operation == Operation.delete;

  @override
  bool get isFetching => _operation == Operation.fetch;

  @override
  bool get isUpdating => _operation == Operation.update;

  @override
  bool get isLoading => _operation == Operation.loading || isUpdating || isFetching || isDeleting || isCreating;

  @override
  bool valueEqualsTo(T? otherValue) {
    if (isAvailable) {
      return _value == otherValue;
    } else if (otherValue == null && isNotAvailable) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void setError(DataError? error) {
    _error = error;
  }

  @override
  void setOperation(Operation operation) {
    _operation = operation;
  }

  @override
  void setValue(value) {
    _value = value;
  }

  @override
  Widget build(final DataWidgetBuilder<T> builder) {
    return DataBuilder<T>(data: this, builder: builder);
  }

  @override
  Widget buildWhen({
    required DataWidgetBuilder<T> onAvailable,
    DataWidgetBuilder<T>? onNotAvailable,
    DataWidgetBuilder<T>? onLoading,
    DataWidgetBuilder<T>? onCreate,
    DataWidgetBuilder<T>? onDelete,
    DataWidgetBuilder<T>? onFetch,
    DataWidgetBuilder<T>? onUpdate,
    DataWidgetBuilder<T>? onError,
    DataWidgetBuilder<T>? orElse,
  }) {
    return WhenDataBuilder<T>(
      data: this,
      onAvailable: onAvailable,
      onNotAvailable: onNotAvailable,
      onLoading: onLoading,
      onCreate: onCreate,
      onDelete: onDelete,
      onFetch: onFetch,
      onUpdate: onUpdate,
      onError: onError,
      orElse: orElse,
    );
  }

  @override
  String toString() => '$runtimeType - operation: $_operation - error: $_error - value : $_value';

  @override
  List<Object?> get props => [_value, _operation, _error];
}

abstract class Store<T extends BaseStore> extends BaseStore with EquatableMixin implements ReadableData<T> {
  DataError? _error;
  Operation _operation = Operation.none;

  @override
  T get value => this as T;

  @override
  DataError get consumeError {
    if (_error == null) {
      throw DataErrorIsNullException();
    }
    DataError consumedErrorValue = _error!;
    _error = null;
    return consumedErrorValue;
  }

  @override
  DataError get error {
    if (_error == null) {
      throw DataErrorIsNullException();
    }
    return _error!;
  }

  @override
  bool get hasError => _error != null;

  @override
  bool get isAvailable;

  @override
  List<Object?> get props;

  @override
  bool get isNotAvailable => !isAvailable;

  @override
  bool get isCreating => _operation == Operation.create;

  @override
  bool get isDeleting => _operation == Operation.delete;

  @override
  bool get isFetching => _operation == Operation.fetch;

  @override
  bool get isUpdating => _operation == Operation.update;

  @override
  bool get isLoading => _operation == Operation.loading || isUpdating || isFetching || isDeleting || isCreating;

  @override
  bool valueEqualsTo(T? otherValue) {
    return this == otherValue;
  }

  void setStoreError(DataError? error) {
    _error = error;
  }

  void setStoreOperation(Operation operation) {
    _operation = operation;
  }

  Widget consume({
    required StoreWidgetBuilder<T> builder,
    final void Function(BuildContext context, T store)? listener,
  }) {
    return StoreConsumer(listener: listener, store: this as T, builder: builder);
  }

  Widget consumeWhen({
    required StoreWidgetBuilder<T> onAvailable,
    void Function(BuildContext context, T store)? listener,
    StoreWidgetBuilder<T>? onNotAvailable,
    StoreWidgetBuilder<T>? onLoading,
    StoreWidgetBuilder<T>? onCreate,
    StoreWidgetBuilder<T>? onDelete,
    StoreWidgetBuilder<T>? onFetch,
    StoreWidgetBuilder<T>? onUpdate,
    StoreWidgetBuilder<T>? onError,
    StoreWidgetBuilder<T>? orElse,
  }) {
    return StoreConsumer(
      store: this as T,
      listener: listener,
      builder: (context, store) {
        return WhenStoreBuilder<T>(
          readableData: this,
          value: this as T,
          onAvailable: onAvailable,
          onNotAvailable: onNotAvailable,
          onLoading: onLoading,
          onCreate: onCreate,
          onDelete: onDelete,
          onFetch: onFetch,
          onUpdate: onUpdate,
          onError: onError,
          orElse: orElse,
        );
      },
    );
  }

  @override
  String toString() => '$runtimeType : operation: $_operation - error: $_error';
}

class BaseStore extends ChangeNotifier {
  final storeId = StoreId();
  void updateStore() => notifyListeners();
}

/// an object that only equals to itslef just like Flutter UniqueKey()
class StoreId {
  @override
  String toString() => '[#${_shortHash(this)}]';
}

String _shortHash(Object? object) {
  return object.hashCode.toUnsigned(20).toRadixString(16).padLeft(5, '0');
}
