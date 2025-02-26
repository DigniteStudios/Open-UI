import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/service_locator.dart';
import '../models/login_model.dart';

abstract class AuthDatasource {
  // Future<Either<Failure, RegisterResponse>> register(RegisterParams params);

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
      return Future.error(error.message ?? "Error!");
    }
  }

}