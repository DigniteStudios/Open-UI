import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/service_locator.dart';
import '../models/login_model.dart';
import '../models/signup_model.dart';

abstract class AuthDatasource {
  Future<Either<Failure, Signup>> register(SignupParams params);

  Future<Either<Failure, Login>> login(LoginParams params);

  // Future<Either<Failure, GeneralTokenResponse>> generalToken(
  //     GeneralTokenParams params,
  //     );
  //
  // Future<Either<Failure, DiagnosticResponse>> logout();
}

class AuthDatasourceImpl implements AuthDatasource {
  final ApiService apiService = locator<ApiService>();


  @override
  Future<Either<Failure, Login>> login(LoginParams params) async {
    try{
      Response res = await apiService.post(ApiEndpoints.login, data: params.toJson());
      Login loginData = Login.fromJson(res.data);
      return Right(loginData);
    }
    on ServerException catch(error){
      return Left(ServerFailure(errorMessage: error.message ?? "Error!",));
    }
  }

  @override
  Future<Either<Failure, Signup>> register(SignupParams params) async {
    try{
      Response res = await apiService.post(ApiEndpoints.register, data: params.toJson());
      Signup signupData = Signup.fromJson(res.data);
      return Right(signupData);
    }
    on ServerException catch(error){
      return Left(ServerFailure(errorMessage: error.message ?? "Error!",));
    }
  }

}