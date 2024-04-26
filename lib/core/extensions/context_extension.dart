import 'package:flutter/material.dart';
import 'package:flutter_bloc_tdd/core/common/app/providers/user_provider.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/entities/user.dart';
import 'package:provider/provider.dart';

extension ContextExt on BuildContext {
  //Context extension
  ThemeData get theme => Theme.of(this);

  //MediaQuery Size extensions
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  UserProvider get userProvider => read<UserProvider>();
  LocalUser? get currentuser => userProvider.user;
}
