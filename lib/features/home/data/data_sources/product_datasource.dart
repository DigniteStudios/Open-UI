import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/service_locator.dart';
import '../models/product_model.dart';

abstract class ProductDatasource {
  Future<Either<Failure, List<Product>>> products();
}

class ProductDatasourceImpl implements ProductDatasource {
  final ApiService apiService = locator<ApiService>();


  @override
  Future<Either<Failure, List<Product>>> products() async {
    try{
      Response res = await apiService.get(ApiEndpoints.products);
      List<Product> resData = productFromJson(res.data);
      return Right(resData);
    }
    on ServerException catch(error){
      return Left(ServerFailure(errorMessage: error.message ?? "Error!",));
    }
  }

}