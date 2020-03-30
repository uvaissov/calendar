import 'package:calendar/core/services/dialog_service.dart';
import 'package:calendar/shared/app_colors.dart';
import 'package:calendar/widgets/dialog_manager.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localizations.dart';

import 'core/providers.dart';
import 'core/router.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/locator.dart';

import 'views/start_up/start_up_view.dart';

void main() async {
  await LocatorInjector.setupLocator();
  Intl.defaultLocale = 'ru_RU';
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: blueColor,
          backgroundColor: backgroundColor,
          scaffoldBackgroundColor: backgroundColor,
        ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
        ],
        localizationsDelegates: [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
          
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },
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
