library home_view;

import 'dart:developer';

import 'package:calendar/constants/route_names.dart';
import 'package:calendar/core/locator.dart';
import 'package:calendar/core/services/navigator_service.dart';
import 'package:calendar/shared/app_colors.dart';
import 'package:calendar/views/home/widgets/emptyListCard.dart';
import 'package:calendar/widgets/CalendarW.dart';
import 'package:calendar/widgets/CardContainer.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _HomeMobile(viewModel),
          desktop: _HomeDesktop(viewModel),
          tablet: _HomeTablet(viewModel),  
        );
      }
    );
  }
}