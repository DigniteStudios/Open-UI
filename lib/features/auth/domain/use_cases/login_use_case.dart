import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await repository.login(params: params);
  }
}