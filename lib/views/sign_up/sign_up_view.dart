library sign_up_view;

import 'package:calendar/shared/ui_helpers.dart';
import 'package:calendar/widgets/busy_button.dart';
import 'package:calendar/widgets/input_field.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'sign_up_view_model.dart';

part 'sign_up_mobile.dart';
part 'sign_up_tablet.dart';
part 'sign_up_desktop.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel = SignUpViewModel();
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _SignUpMobile(viewModel),
          desktop: _SignUpDesktop(viewModel),
          tablet: _SignUpTablet(viewModel),  
        );
      }
    );
  }
}