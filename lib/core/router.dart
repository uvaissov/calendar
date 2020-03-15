import 'package:calendar/constants/route_names.dart';
import 'package:calendar/core/models/document.dart';
import 'package:calendar/views/add_and_edit/add_and_edit_view.dart';
import 'package:calendar/views/home/home_view.dart';
import 'package:calendar/views/login/login_view.dart';
import 'package:calendar/views/sign_up/sign_up_view.dart';
//import 'package:compound/models/post.dart';
//import 'package:compound/ui/views/create_post_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case AddAndEditViewRoute:
      var documentToEdit = settings.arguments as Document;
      return SlideRightRoute(widget:AddAndEditView(
          edittingDocument: documentToEdit,
        ));
      // return _getPageRoute(
      //   routeName: settings.name,
      //   viewToShow: AddAndEditView(
      //     edittingDocument: documentToEdit,
      //   ),
      // );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
