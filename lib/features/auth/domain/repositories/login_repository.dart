import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login({required LoginParams params});
}