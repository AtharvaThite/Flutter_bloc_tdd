import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tdd/core/usecases/usecases.dart';
import 'package:flutter_bloc_tdd/core/utils/typedefs.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/repos/auth_repo.dart';

class SignUp extends UsecaseWithParams<void, SignUpParams> {
  const SignUp(this._authRepo);
  final AuthRepo _authRepo;
  @override
  ResultFuture<void> call(SignUpParams params) => _authRepo.signUp(
        fullName: params.fullName,
        email: params.email,
        password: params.password,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.fullName,
    required this.email,
    required this.password,
  });

  const SignUpParams.empty()
      : fullName = '',
        email = '',
        password = '';

  final String fullName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [fullName, email, password];
}
