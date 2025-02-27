import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../../../../core/services/service_locator.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/use_cases/signup_use_case.dart';

final signupProvider = ChangeNotifierProvider<SignupProvider>((ref) {
  return SignupProvider();
});

class SignupProvider extends ChangeNotifier {
  String? id;
  SignupProvider();


  void handleSignup({
    required String email,
    required String password
  }) async {
    final params = SignupParams(
        email: email,
        password: password,
        phone: '',
        firstName: '',
        lastName: ''
    );
    Either<Failure, SignupEntity> _signup = await locator<SignupUseCase>().call(params);

    _signup.fold(
          (newFailure) {
        debugPrint("Failure::::::::");
      },
          (newResult) {
        debugPrint("Result::::::::");
      },
    );

  }
}