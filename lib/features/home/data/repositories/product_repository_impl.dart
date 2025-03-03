import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/products_repository.dart';
import '../data_sources/product_datasource.dart';

abstract class ProductRepositoryInternal implements ProductRepository {}

class ProductRepositoryImpl implements ProductRepositoryInternal {
  final ProductDatasource dataSource;

  const ProductRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    final loginResponse = await dataSource.products();

    return loginResponse.fold(
          (left) => Left(ServerFailure(errorMessage: left.errorMessage)),
          (right) => Right(right),
    );
  }

}