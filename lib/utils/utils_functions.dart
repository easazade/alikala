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
//   String kb2Mb() {
//     var num = int.tryParse(this);
//     if (num == null)
//       return this;
//     else {
//       num = (num / 1000000).floor();
//       return '${num}MB';
//     }
//   }

//   String fixUnicodeEscaped() {
//     //for characters with \\ like -> \\u044F
// //    final RegExp r = RegExp(r'\\\\u([0-9a-fA-F]+)');

//     //for characters with \ like -> \\u044F
//     final RegExp r = RegExp(r'\\u([0-9a-fA-F]+)');

//     // Sample string to parse.
// //    final String source =
// //        r'\\u0414\\u043B\\u044F \\u043F\\u0440\\u043E\\u0434\\u0430\\u0436\\u0438 \\u043D\\u0435\\u0434\\u0432\\u0438\\u0436\\u0438\\u043C\\u043E\\u0441\\u0442\\u0438';

//     // Replace each \u0123 with the decoded codepoint.
//     final String decoded = this.replaceAllMapped(r, (Match m) {
//       // Extract the parenthesised hex string. '\\u0123' -> '123'.
//       final String hexString = m.group(1);

//       // Parse the hex string to an int.
//       final int codepoint = int.parse(hexString, radix: 16);

//       // Convert codepoint to string.
//       return String.fromCharCode(codepoint);
//     });
//     return decoded;
//   }

//   void go([arguments]) {
//     sailor.navigate(this, args: arguments);
//   }

//   void launchUrl() async {
//     print(this);
//     if (await canLaunch(this)) launch(this);
//   }

//   String removePlus98() {
//     return this.replaceFirst('+98', '');
//   }

//   bool get isValidUrl => Uri.parse(this).isAbsolute;

  String commaSeparated() {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    // ignore: prefer_function_declarations_over_variables
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    String result = replaceAllMapped(reg, mathFunc);
    return result;
  }

//   int findFirstNumber() {
//     for (var i = 0; i < this.length; i++) {
//       var character = this[i];
//       if (isNumeric(character)) {
//         return int.tryParse(character);
//       }
//     }
//     return null;
//   }

  bool get isNullOrBlank => trim().isEmpty;

//   String swapFaNumericToEn() {
//     var result = this;
//     var numbersFa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
//     var numbersEn = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
//     for (var i = 0; i < result.length; i++) {
//       var character = result[i];
//       for (var j = 0; j < numbersFa.length; j++) {
//         if (character == numbersFa[j]) {
//           result = result.replaceFirst(character, numbersEn[j], i);
//         }
//       }
//     }
//     return result;
//   }
// }

// extension MapExt<T, S> on Map<T, S> {
//   bool hasKeyWithValue(T key, S value) {
//     if (this.containsKey(key)) {
//       if (this[key] == value) {
//         return true;
//       }
//     }
//     return false;
//   }
// }

// extension SailorExt on Sailor {
//   void popUntilHome<T>() {
//     return this.popUntil((route) {
//       return route.isFirst;
//     });
//   }

//   Future<T> pushAndRemoveUntilRoute<T>(String routeName, String untilRoute, {BaseArguments arg}) async {
//     return this.navigate(
//       routeName,
//       args: arg,
//       navigationType: NavigationType.pushAndRemoveUntil,
//       removeUntilPredicate: (route) {
//         if (untilRoute != null)
//           return untilRoute == route.settings.name;
//         else
//           return route.isFirst;
//       },
//     );
//   }

//   Future<T> pushAndRemoveEverything<T>(String routeName, {BaseArguments args}) async {
//     return this.navigate(
//       routeName,
//       args: args,
//       navigationType: NavigationType.pushAndRemoveUntil,
//       removeUntilPredicate: (route) {
//         return false;
//       },
//     );
//   }
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

  // void printItems([String print(T t)]) {
  //   log('======================================================');
  //   for (var i = 0; i < this.length; i++) {
  //     var item = this[i];
  //     (print == null) ? log('\n $item \n') : log('\n ${print(item)} \n');
  //   }
  //   log('======================================================');
  // }

  // bool get isNotNulOrEmpty => isNotNullOrEmpty(this);
}

// //##################################### utility functions #####################################
// //##################################### utility functions #####################################

// bool isNotNullOrEmpty<T>(List<T> list) {
//   if (list == null)
//     return false;
//   else if (list.isEmpty)
//     return false;
//   else
//     return true;
// }

// Future<bool> check() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.mobile) {
//     return true;
//   } else if (connectivityResult == ConnectivityResult.wifi) {
//     return true;
//   }
//   return false;
// }

// void report(e, stacktrace) {
//   if (e is AppException) {
//     if (!e.isReported && e.shouldBeReported) {
//       e.isReported = true;
// //        Crashlytics.instance.recordError(e, stacktrace);
//     }
//   } else {
// //      Crashlytics.instance.recordError(e, stacktrace);
//   }
//   if (!kReleaseMode) {
//     print(e);
//     print(stacktrace);
//   }
// }

showAppToastWithAction(BuildContext context, String msg, {required BoolCallback action, double length = 2.5}) {
  //TODO add flash library here
  // Flushbar<bool> flush;
  // flush = Flushbar<bool>(
  //   messageText: SizedBox(
  //     height: 60,
  //     child: Text(msg, style: TextStyle(color: Colors.white)),
  //   ),
  //   animationDuration: 0.2.seconds(),
  //   margin: const EdgeInsets.only(bottom: 64, right: 20, left: 20, top: 10),
  //   borderRadius: 8,
  //   mainButton: GestureDetector(
  //     onTap: () => flush.dismiss(true),
  //     behavior: HitTestBehavior.opaque,
  //     child: Column(
  //       children: [
  //         SizedBox(height: 40),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 12.0),
  //           child: Text('باشه', style: TextStyle(color: AppColors.THEME_ACCENT_2)),
  //         ),
  //       ],
  //     ),
  //   ),
  //   backgroundColor: Colors.black,
  //   duration: length.seconds(),
  // )..show(context).then((value) {
  //     action?.call(value ?? false);
  //   });
}

// void unFocusCurrentFocus(BuildContext context){
//   FocusScopeNode currentFocus = FocusScope.of(context);
//   if (!currentFocus.hasPrimaryFocus) {
//     Footprint.log('has primary focus and now unfocusing');
//     currentFocus.requestFocus(FocusNode());
//   }
// }

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

// Widget showWarningToastAndReturn(Widget widget, String msg) {
//   showWarningToast(msg);
//   return widget;
// }

// Widget showSuccessToastAndReturn(Widget widget, String msg) {
//   showSuccessToast(msg);
//   return widget;
// }

// double randomDouble(int min, int max) {
//   math.Random rnd;
//   rnd = new math.Random();
//   double r = min + rnd.nextInt(max - min).toDouble();
//   return r;
// }

// int countSmsPages(String msg) {
//   int mode70 = msg.length ~/ 70;
//   print(mode70);
//   var n = mode70 + 1;
//   return n;
// }

// String calculateChosenRange(int startingIndex, int endingIndex) {
//   if (startingIndex == null || endingIndex == null)
//     return '-';
//   else {
//     return (endingIndex - startingIndex).toString();
//   }
// }

// isNumeric(String string) => num.tryParse(string ?? '') != null;

// Future callNumber(String number) async {
//   var uri = 'tel://$number';
//   if (await canLaunch(uri)) {
//     await launch(uri);
//   }
// }
