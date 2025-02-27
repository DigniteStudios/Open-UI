import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/signup_entity.dart';

abstract class SignupRepository {
  Future<Either<Failure, SignupEntity>> signup({required SignupParams params});
}