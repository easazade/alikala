import 'package:alikala/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shamsi_date/shamsi_date.dart';

extension DoubleExt on double {
  Future<Duration> secondsDelay() async => Future.delayed(seconds());

  Duration seconds() => Duration(milliseconds: (this * 1000).toInt());
}

extension IntegersExt on int {
  Future<Duration> secondsDelay() async => Future.delayed(seconds());

  Duration seconds() => Duration(seconds: this);

  String commaSeparated() => toString().commaSeparated();

  bool get isOdd => this % 2 == 1;

  bool get isOk => this >= 200 && this < 300;

  bool get isClientError => this >= 400 && this < 500;

  bool get isServerError => this >= 500;

  String asPeriodName() {
    if (this == 1) {
      return 'زنگ اول';
    } else if (this == 2) {
      return 'زنگ دوم';
    } else if (this == 3) {
      return 'زنگ سوم';
    } else if (this == 4) {
      return 'زنگ چهارم';
    } else if (this == 5) {
      return 'زنگ پنجم';
    } else {
      return toString();
    }
  }
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

  Jalali toJalali() => Jalali.fromDateTime(this);

  DateTime get tomorrow => DateTime(year, month, day + 1, hour, minute, second, millisecond, microsecond);

  ///
  /// jalali weekday starts from saturday which has the value 0 and ends with friday which has the value 6
  int get jalaliWeekday {
    if (weekday == 1) {
      return 2;
    }
    if (weekday == 2) {
      return 3;
    }
    if (weekday == 3) {
      return 4;
    }
    if (weekday == 4) {
      return 5;
    }
    if (weekday == 5) {
      return 6;
    }
    if (weekday == 6) {
      return 0;
    }
    if (weekday == 7) {
      return 1;
    } else {
      throw Exception('unknown jalaliweekday');
    }
  }

  String get jalaliWeekdayName {
    if (jalaliWeekday == 0) {
      return 'شنبه';
    }
    if (jalaliWeekday == 1) {
      return 'یکشنبه';
    }
    if (jalaliWeekday == 2) {
      return 'دوشنبه';
    }
    if (jalaliWeekday == 3) {
      return 'سه‌شنبه';
    }
    if (jalaliWeekday == 4) {
      return 'چهارشنبه';
    }
    if (jalaliWeekday == 5) {
      return 'پنجشنبه';
    }
    if (jalaliWeekday == 6) {
      return 'جمعه';
    } else {
      throw Exception('unknown jalaliweekday name');
    }
  }

  String get jalaliWeekDayRelative {
    var now = DateTime.now();
    var diff = difference(now);
    if (diff.inMinutes > 48 * 60) return jalaliWeekdayName;
    if (now == this) return 'امروز';
    if (isBefore(now)) {
      diff = now.difference(this);
      if (diff < Duration(hours: 24)) {
        if (now.day != day) {
          return 'دیروز';
        } else {
          return 'امروز';
        }
      } else {
        if (now.day == add(Duration(days: 1)).day) {
          return 'دیروز';
        } else if (now.day == add(Duration(days: 2)).day) {
          return 'پریروز';
        } else {
          return jalaliWeekdayName;
        }
      }
    } else if (isAfter(now)) {
      if (diff < Duration(hours: 24)) {
        if (now.day != day) {
          return 'فردا';
        } else {
          return 'امروز';
        }
      } else {
        if (now.day == subtract(Duration(days: 1)).day) {
          return 'فردا';
        } else if (now.day == subtract(Duration(days: 2)).day) {
          return 'پس‌فردا';
        } else {
          return jalaliWeekdayName;
        }
      }
    } else {
      return jalaliWeekdayName;
    }
  }
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
