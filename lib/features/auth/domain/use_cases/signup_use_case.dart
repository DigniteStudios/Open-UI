import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/signup_entity.dart';
import '../repositories/signup_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, SignupEntity>> call(SignupParams params) async {
    return await repository.signup(params: params);
  }
}