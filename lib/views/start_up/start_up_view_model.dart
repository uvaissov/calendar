import 'package:calendar/constants/route_names.dart';
import 'package:calendar/core/base/base_view_model.dart';
import 'package:calendar/core/locator.dart';
import 'package:calendar/core/services/authentication_service.dart';
import 'package:calendar/core/services/navigator_service.dart';

class StartUpViewModel extends BaseViewModel {
  StartUpViewModel();

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigatorService _navigationService = locator<NavigatorService>();
  

  Future handleStartUpLogic() async {
    // Register for push notifications
    //await _pushNotificationService.initialise();
    
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    log.i('hasLoggedInUser $hasLoggedInUser');
    if (hasLoggedInUser) {
      //_navigationService.navigateTo(HomeViewRoute);
      _navigationService.navigateToAndRemoveUntil(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
  // Add ViewModel specific code here
}