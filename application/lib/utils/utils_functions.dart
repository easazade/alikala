import 'package:application/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SealedResult<T> {
  final T? _value;
  final Exception? _exception;

  SealedResult._(this._value, this._exception);

  factory SealedResult.failure(Exception exception) => SealedResult._(null, exception);
  factory SealedResult.success(T value) => SealedResult._(value, null);

  bool get hasResult => _value != null;

  bool get hasError => _exception != null;
}

extension FutureX<T> on Future<T> {
  Future<SealedResult<T>> sealed() async {
    try {
      final result = await this;
      return SealedResult.success(result);
    } on Exception catch (e) {
      return SealedResult.failure(e);
    }
  }
}

extension DoubleExt on double {
  Future secondsDelay() async => Future.delayed(seconds());

  Duration seconds() => Duration(milliseconds: (this * 1000).toInt());
}

extension IntegersExt on int {
  Future secondsDelay() async => Future.delayed(seconds());

  Duration seconds() => Duration(seconds: this);

  String commaSeparated() => toString().commaSeparated();

  bool get isOdd => this % 2 == 1;

  bool get isOk => this >= 200 && this < 300;

  bool get isClientError => this >= 400 && this < 500;

  bool get isServerError => this >= 500;
}

extension StringExtNullable on String? {
  bool get isNullOrBlank => this?.trim().isEmpty ?? true;
}

extension StringExt on String {
  String commaSeparated() {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    // ignore: prefer_function_declarations_over_variables
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    String result = replaceAllMapped(reg, mathFunc);
    return result;
  }

  bool get isNullOrBlank => trim().isEmpty;
}

extension DateTimeExt on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime get tomorrow => DateTime(year, month, day + 1, hour, minute, second, millisecond, microsecond);
}

extension ListExt<T> on List<T> {
  List<T> removeDuplicates(int Function(T a) getUnicId) {
    final Set<int> ids = map((item) => getUnicId(item)).toSet();
    List<T> cloneList = map((item) => item).toList();
    cloneList.retainWhere((x) => ids.remove(getUnicId(x)));
    return cloneList.toList();
  }

  T? get firstOrNull {
    if (isNotEmpty == true) {
      return first;
    } else {
      return null;
    }
  }
}

showAppToastWithAction(BuildContext context, String msg, {required BoolCallback action, double length = 2.5}) {
  //TODO: implement
  // use toastification
}

void showSuccessToast(String msg, {bool lengthLong = false}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    backgroundColor: Colors.green,
    toastLength: lengthLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
  );
}

void showInfoToast(String msg, {bool lengthLong = false}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.black,
    backgroundColor: Colors.amberAccent,
    toastLength: lengthLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
  );
}

void showWarningToast(String msg, {bool lengthLong = false, ToastGravity? gravity}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    gravity: gravity ?? ToastGravity.BOTTOM,
    textColor: Colors.white,
    backgroundColor: Colors.redAccent,
    toastLength: lengthLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
  );
}
