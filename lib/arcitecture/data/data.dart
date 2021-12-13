import 'package:alikala/arcitecture/data/data_builder.dart';
import 'package:alikala/arcitecture/data/exceptions.dart';
import 'package:alikala/arcitecture/store/store.dart';
import 'package:alikala/arcitecture/store/store_consumer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

enum Operation { loading, update, delete, fetch, create, none }

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

  Widget build(
    final DataWidgetBuilder builder,
  );

  Widget buildWhen({
    required DataWidgetBuilder onAvailable,
    DataWidgetBuilder? onNotAvailable,
    DataWidgetBuilder? onLoading,
    DataWidgetBuilder? onCreate,
    DataWidgetBuilder? onDelete,
    DataWidgetBuilder? onFetch,
    DataWidgetBuilder? onUpdate,
    DataWidgetBuilder? onError,
    DataWidgetBuilder? orElse,
  });
}

abstract class Editable<T> {
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

class Data<T> implements ReadableData<T>, Editable<T> {
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
  Widget build(
    final DataWidgetBuilder builder,
  ) {
    return DataBuilder<T>(data: this, builder: builder);
  }

  @override
  Widget buildWhen({
    required DataWidgetBuilder onAvailable,
    DataWidgetBuilder? onNotAvailable,
    DataWidgetBuilder? onLoading,
    DataWidgetBuilder? onCreate,
    DataWidgetBuilder? onDelete,
    DataWidgetBuilder? onFetch,
    DataWidgetBuilder? onUpdate,
    DataWidgetBuilder? onError,
    DataWidgetBuilder? orElse,
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
  operator ==(Object? other) {
    if (other is ReadableData<T>) {
      if (isAvailable == other.isAvailable && hasError == other.hasError) {
        return isLoading == other.isLoading &&
            isUpdating == other.isUpdating &&
            isDeleting == other.isDeleting &&
            isFetching == other.isFetching &&
            isCreating == other.isCreating &&
            _value == other.value;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  int get hashCode => super.hashCode + _error.hashCode + _value.hashCode + _operation.hashCode;

  @override
  String toString() => '$runtimeType - operation: $_operation - error: $_error - value : $_value';
}
