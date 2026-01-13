import 'package:flutter/material.dart';

class ServiceLocator {
  static BuildContext? _appContext;

  static void setContext(BuildContext context) {
    _appContext = context;
  }

  static BuildContext get context => _appContext!;
}