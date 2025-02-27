
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/repositories/signup_repository.dart';
import '../data_sources/auth_data_sources.dart';

abstract class AuthRepositoryInternal implements LoginRepository, SignupRepository {}

class AuthRepositoryImpl implements AuthRepositoryInternal {
  final AuthDatasource dataSource;

  const AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoginEntity>> login({required LoginParams params}) async {
    final loginResponse = await dataSource.login(params);

    return loginResponse.fold(
        (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
        (right) => Right(right),
    );
  }

  @override
  Future<Either<Failure, SignupEntity>> signup({required SignupParams params}) async {
    final signupResponse = await dataSource.register(params);

    return signupResponse.fold(
          (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
          (right) => Right(right),
    );
  }

}