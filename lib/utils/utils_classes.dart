import 'dart:collection';

import 'package:alikala/core/constants.dart';
import 'package:alikala/core/injectable.dart';
import 'package:alikala/core/navigation.dart';
import 'package:alikala/utils/typedefs.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/util/action_error_widget.dart';
import 'package:alikala/widgets/util/app_progress.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart' as mockito;

class Msg {
  String message;

  Msg(this.message);

  void ifNotConsumed(StringCallback callback) {
    if (message != null) {
      callback(message);
    }
    message = null;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(other) => this.message == other.msg;
}

@LazySingleton(env: [Env.prod])
class ConnectionChecker {
  Future<bool> hasConnection() => check();
}

@LazySingleton(env: [Env.test])
class FakeConnectionChecker extends mockito.Mock implements ConnectionChecker {
  FakeConnectionChecker() {
    mockito.when(hasConnection()).thenAnswer((_) => Future.value(true));
  }

  void setConnectedAs(bool connected) {
    mockito.when(hasConnection()).thenAnswer((_) => Future.value(connected));
  }
}

class BoolSwitcher {
  bool currentValue = false;

  BoolSwitcher({bool initialValue}) {
    if (initialValue != null) {
      currentValue = initialValue;
    }
  }

  bool get value {
    currentValue = !currentValue;
    return currentValue;
  }
}

enum MsgType { WARNING, SUCCESS, DIALOG, DIALOG_PROGRESS, DIALOG_ACTION, INFO }

class ToastMsg {
  MsgType type;
  String msg;
  String title;
  String asset;
  IconData icon;
  bool dismissible;
  bool lengthLong;
  String actionText;
  VoidCallback action;

  ToastMsg._(
    this.type,
    this.msg, {
    this.title,
    this.lengthLong,
    this.asset,
    this.icon,
    this.dismissible,
    this.action,
    this.actionText,
  });

  factory ToastMsg.success(String msg, {bool lengthLong = false}) => ToastMsg._(MsgType.SUCCESS, msg, lengthLong: lengthLong);

  factory ToastMsg.warning(String msg, {bool lengthLong = false}) => ToastMsg._(MsgType.WARNING, msg, lengthLong: lengthLong);

  factory ToastMsg.info(String msg, {bool lengthLong = false}) => ToastMsg._(MsgType.INFO, msg, lengthLong: lengthLong);

  factory ToastMsg.noConnected() => ToastMsg._(MsgType.WARNING, 'عدم اتصال به اینترنت', lengthLong: false);

  factory ToastMsg.dialog(String msg, {String title, String asset, IconData icon, bool dismissible = true}) => ToastMsg._(
        MsgType.DIALOG,
        msg,
        title: title,
        lengthLong: false,
        asset: asset,
        icon: icon,
        dismissible: dismissible,
      );

  factory ToastMsg.actionDialog(
    String msg,
    VoidCallback action,
    String actionText, {
    String title,
    String asset,
    IconData icon,
    bool dismissible = true,
  }) =>
      ToastMsg._(
        MsgType.DIALOG_ACTION,
        msg,
        title: title,
        lengthLong: false,
        asset: asset,
        icon: icon,
        dismissible: dismissible,
        actionText: actionText,
        action: action,
      );

  factory ToastMsg.progressDialog({String title, String msg, bool dismissible = false}) => ToastMsg._(
        MsgType.DIALOG_PROGRESS,
        msg ?? "لطفا منتظر بمانید ...",
        title: title,
        lengthLong: false,
        dismissible: dismissible,
      );

  void show(BuildContext context) {
    if (msg != null) {
      var holder = msg;
      msg = null;
      if (type == MsgType.SUCCESS) {
        showSuccessToast(holder, lengthLong: lengthLong);
      } else if (type == MsgType.WARNING) {
        showWarningToast(holder, lengthLong: lengthLong);
      } else if (type == MsgType.INFO) {
        showInfoToast(holder, lengthLong: lengthLong);
      } else if (type == MsgType.DIALOG) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
            barrierDismissible: dismissible,
            context: context,
            child: AlertDialog(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 18),
                    if (asset != null) ...[
                      Image.asset(asset, width: 60),
                      SizedBox(height: 12),
                    ],
                    if (icon != null && asset == null) ...[
                      Icon(icon, size: 60, color: AppColors.THEME_ACCENT),
                      SizedBox(height: 12),
                    ],
                    if (title != null) ...[
                      Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: AppColors.TEXT_DARK)),
                      SizedBox(height: 3),
                    ],
                    Text(holder, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: AppColors.TEXT_LIGHT)),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        });
      } else if (type == MsgType.DIALOG_PROGRESS) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
            barrierDismissible: dismissible,
            context: context,
            child: AlertDialog(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    if (title != null) ...[
                      Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: AppColors.TEXT_DARK)),
                      SizedBox(height: 10),
                    ],
                    if (holder != null) ...[
                      Text(holder, textAlign: TextAlign.center, style: TextStyle(color: AppColors.TEXT_MED)),
                      SizedBox(height: 10),
                    ],
                    AppProgress.large(),
                  ],
                ),
              ),
            ),
          );
        });
      } else if (type == MsgType.DIALOG_ACTION) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
            barrierDismissible: dismissible,
            context: context,
            child: AlertDialog(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 18),
                    if (asset != null) ...[
                      Image.asset(asset, width: 60),
                      SizedBox(height: 12),
                    ],
                    if (icon != null && asset == null) ...[
                      Icon(icon, size: 60, color: AppColors.THEME_ACCENT),
                      SizedBox(height: 12),
                    ],
                    if (title != null) ...[
                      Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: AppColors.TEXT_DARK)),
                      SizedBox(height: 3),
                    ],
                    Text(holder, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: AppColors.TEXT_MED)),
                    SizedBox(height: 15),
                    if (action != null && actionText != null)
                      FlatButton(
                        onPressed: action,
                        child: Text(actionText, style: TextStyle(color: Colors.white)),
                        color: AppColors.THEME_ACCENT,
                      ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        });
      }
    }
  }

  @override
  bool operator ==(other) {
    if (other is ToastMsg) {
      return this.msg == other.msg;
    } else
      return false;
  }

  @override
  int get hashCode => super.hashCode + this.msg.hashCode + 2;

  @override
  String toString() => 'toast: $msg';
}

class DialogMsg {
  String title;
  String msg;

  DialogMsg(this.title, this.msg);

  void show(BuildContext context) {
    if (msg != null) {
      var holder = msg;
      msg = null;
      showDialog(
        context: context,
        child: AlertDialog(
          title: Text(title, style: TextStyles.dark_18_w700),
          content: Text(holder),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: sailor.pop,
                child: Text('باشه', style: TextStyle(color: AppColors.THEME_ACCENT, fontSize: 16)),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  bool operator ==(other) {
    if (other is ToastMsg) {
      return this.msg == other.msg;
    } else
      return false;
  }

  @override
  int get hashCode => super.hashCode + this.msg.hashCode + 2;

  @override
  String toString() => 'toast: $msg';
}

class ActionError {
  VoidCallback action;
  String msg;

  ActionError(this.msg, this.action);

  ActionError.notConnected(this.action) {
    msg = 'عدم اتصال به اینترنت';
  }

  Widget widget() {
    if (msg == 'عدم اتصال به اینترنت')
      return ActionErrorWidget(msg, action, icon: FeatherIcons.wifiOff);
    else
      return ActionErrorWidget(msg, action);
  }

  @override
  bool operator ==(other) {
    if (other is ActionError) {
      return this.msg == other.msg;
    } else
      return false;
  }

  @override
  int get hashCode => super.hashCode + this.msg.hashCode + 2;

  @override
  String toString() => 'actionError: $msg';
}

class Stack<T> {
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
