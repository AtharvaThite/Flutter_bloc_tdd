import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tdd/core/usecases/usecases.dart';
import 'package:flutter_bloc_tdd/core/utils/typedefs.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/repos/auth_repo.dart';

class SignIn extends UsecaseWithParams<void, SignInParams> {
  const SignIn(this._authRepo);
  final AuthRepo _authRepo;
  @override
  ResultFuture<void> call(SignInParams params) => _authRepo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  const SignInParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
