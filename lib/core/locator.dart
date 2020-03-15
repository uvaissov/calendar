


import '../core/logger.dart';
import '../core/services/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'services/authentication_service.dart';
import 'services/firestore_service.dart';
import 'services/dialog_service.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static Logger _log = getLogger('LocatorInjector');

  static Future<void> setupLocator() async {
    _log.d('Initializing Navigator Service');
    locator.registerLazySingleton(() => NavigatorService());
    _log.d('Initializing Authentication Service');
    locator.registerLazySingleton(() => AuthenticationService());
    _log.d('Initializing Firestore Service');
    locator.registerLazySingleton(() => FirestoreService());
    _log.d('Initializing Dialog Service');
    locator.registerLazySingleton(() => DialogService());
  }
}