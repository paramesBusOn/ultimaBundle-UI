import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ultimate_bundle/src/treshop/src/helpers/colors.dart';


Future showToast(
    {required String msg, Color? backgroundColor, Color? textColor}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    gravity: ToastGravity.CENTER,
    backgroundColor: ColorDark.card,
    textColor: textColor ?? Colors.white,
  );
}

SnackbarController showSnackbar(
  BuildContext context, {
  required String title,
  required String subtitle,
  SnackPosition position = SnackPosition.BOTTOM,
}) {
  final theme = Theme.of(context);
  return Get.snackbar(
    '',
    '',
    titleText: Text(title, style: theme.textTheme.headline4),
    messageText: Text(subtitle, style: theme.textTheme.subtitle2),
    forwardAnimationCurve: Curves.easeInBack,
    backgroundColor: theme.cardColor,
    icon:const Icon(FeatherIcons.checkCircle),
    snackPosition: position,
  );
}
