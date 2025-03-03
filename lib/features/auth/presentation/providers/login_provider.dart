import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/use_cases/login_use_case.dart';

final loginProvider = ChangeNotifierProvider<LoginProvider>((ref) {
  return LoginProvider();
});

class LoginProvider extends ChangeNotifier {
  LoginEntity? token;
  Failure? failure;
  bool loading = false;
  LoginProvider();


  void handleLogin({
    required String email,
    required String password
  }) async {
    loading = true;
    failure = null;
    notifyListeners();
    final params = LoginParams(email: email, password: password);
    Either<Failure, LoginEntity> _login = await locator<LoginUseCase>().call(params);

    _login.fold(
          (newFailure) {
            token = null;
            loading = false;
            failure = newFailure;
            notifyListeners();
          },
          (newResult) {
            token = newResult;
            failure = null;
            loading = false;
            notifyListeners();
          },
    );

  }
}