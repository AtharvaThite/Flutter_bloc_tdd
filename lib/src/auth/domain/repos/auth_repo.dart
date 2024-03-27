import 'package:flutter_bloc_tdd/core/enums/update_user.dart';
import 'package:flutter_bloc_tdd/core/utils/typedefs.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<void> forgotPassword(
    String email,
  );

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });
}
