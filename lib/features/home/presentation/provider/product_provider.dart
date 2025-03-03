import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/product_use_case.dart';

final productProvider = ChangeNotifierProvider<ProductProvider>((ref) {
  return ProductProvider();
});

class ProductProvider extends ChangeNotifier {
  List<ProductEntity> products = [];
  Failure? failure;

  Future<void> getProducts() async {
    failure = null;
    notifyListeners();
    Either<Failure, List<ProductEntity>> fetch = await locator<ProductsUseCase>().call();

    fetch.fold((newFailure) {
        failure = newFailure;
        notifyListeners();
      },
      (newResult) {
        products = newResult;
        failure = null;
        notifyListeners();
      },
    );
  }
}