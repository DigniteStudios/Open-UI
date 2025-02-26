
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/auth_data_sources.dart';

class AuthRepositoryImpl implements LoginRepository {
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

}