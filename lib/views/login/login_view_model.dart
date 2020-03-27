import 'package:calendar/constants/route_names.dart';
import 'package:calendar/core/base/base_view_model.dart';
import 'package:calendar/core/locator.dart';
import 'package:calendar/core/services/authentication_service.dart';
import 'package:calendar/core/services/dialog_service.dart';
import 'package:calendar/core/services/navigator_service.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();

  final NavigatorService _navigatorService = locator<NavigatorService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    busy = true;
    
    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    log.i('email: $email, password: $password, result: $result');

    busy = false ;

    if (result is bool) {
      if (result) {
        _navigatorService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Ошибка при авторизации',
        description: result,
      );
    }
  }

  void navigateToSignUp() {
    _navigatorService.navigateTo(SignUpViewRoute);
  }
  
  // Add ViewModel specific code here
}