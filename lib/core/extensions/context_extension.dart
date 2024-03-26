import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  //Context extension
  ThemeData get theme => Theme.of(this);

  //MediaQuery Size extensions
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;
}
