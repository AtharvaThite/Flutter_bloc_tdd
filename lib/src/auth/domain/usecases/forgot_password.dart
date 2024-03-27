import 'package:flutter_bloc_tdd/core/usecases/usecases.dart';
import 'package:flutter_bloc_tdd/core/utils/typedefs.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._authRepo);
  final AuthRepo _authRepo;
  @override
  ResultFuture<void> call(String params) {
    return _authRepo.forgotPassword(params);
  }
}
