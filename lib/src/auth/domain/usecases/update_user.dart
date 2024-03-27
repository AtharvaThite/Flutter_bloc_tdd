import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tdd/core/enums/update_user.dart';
import 'package:flutter_bloc_tdd/core/usecases/usecases.dart';
import 'package:flutter_bloc_tdd/core/utils/typedefs.dart';
import 'package:flutter_bloc_tdd/src/auth/domain/repos/auth_repo.dart';

class UpdateUser extends UsecaseWithParams<void, UpdateUserParams> {
  const UpdateUser(this._authRepo);
  final AuthRepo _authRepo;
  @override
  ResultFuture<void> call(UpdateUserParams params) => _authRepo.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.action,
    required this.userData,
  });

  const UpdateUserParams.empty()
      : action = UpdateUserAction.displayName,
        userData = '';

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<Object?> get props => [action, userData];
}
