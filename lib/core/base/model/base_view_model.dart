import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? viewContext;
  void setContext(BuildContext context);
  void init();
}
