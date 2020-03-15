import 'package:calendar/constants/route_names.dart';
import 'package:calendar/core/base/base_view_model.dart';
import 'package:calendar/core/locator.dart';
import 'package:calendar/core/services/authentication_service.dart';
import 'package:calendar/core/services/dialog_service.dart';
import 'package:calendar/core/services/navigator_service.dart';
import 'package:flutter/foundation.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel();

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();


  Future signUp({
    @required String email,
    @required String password,
    @required String fullName,
  }) async {
    //setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        //role: _selectedRole
        );

    //setBusy(false);

    if (result is bool) {
      if (result) {
        _navigatorService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
  
  // Add ViewModel specific code here
}