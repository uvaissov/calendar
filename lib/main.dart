import 'package:calendar/core/services/dialog_service.dart';
import 'package:calendar/widgets/dialog_manager.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/router.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/start_up/start_up_view.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        builder: (context, child) => Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child)),
        ),
        navigatorKey: locator<NavigatorService>().navigatorKey,
        home: StartUpView(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}