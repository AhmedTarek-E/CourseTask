import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void logDebug(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

Future<T?> pushMaterialPage<T>(
    BuildContext context,
    Widget page,
    {
      bool rootNavigator = false,
      RouteSettings? settings,
      bool fullscreenDialog = false
    }) {
  return Navigator.of(context, rootNavigator: rootNavigator)
      .push(MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog
  ));
}