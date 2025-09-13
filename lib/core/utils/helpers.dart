import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forui/forui.dart';

void showFlutterToast({BuildContext? context, required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: context?.theme.colors.background,
    textColor: context?.theme.colors.foreground,
    fontSize: context?.theme.typography.base.fontSize,
  );
}
