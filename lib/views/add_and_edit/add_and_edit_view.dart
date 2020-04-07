library add_and_edit_view;

import 'package:calendar/core/localizations.dart';
import 'package:calendar/core/models/document.dart';
import 'package:calendar/shared/app_colors.dart';
import 'package:calendar/shared/shared_styles.dart';
import 'package:calendar/shared/ui_helpers.dart';
import 'package:calendar/widgets/busy_button.dart';
import 'package:calendar/widgets/checkbox_field.dart';
import 'package:calendar/widgets/date_field.dart';
import 'package:calendar/widgets/expansion_list.dart';
import 'package:calendar/widgets/input_field.dart';
import 'package:flutter/services.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'add_and_edit_view_model.dart';

part 'add_and_edit_mobile.dart';
part 'add_and_edit_tablet.dart';
part 'add_and_edit_desktop.dart';

class AddAndEditView extends StatelessWidget {
  final Document edittingDocument;
  AddAndEditView({ Key key, this.edittingDocument }): super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAndEditViewModel viewModel = AddAndEditViewModel();
    return ViewModelProvider<AddAndEditViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        viewModel.edittingDocument = this.edittingDocument;
        viewModel.stepsLength = 3;
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _AddAndEditMobile(viewModel),
          desktop: _AddAndEditDesktop(viewModel),
          tablet: _AddAndEditTablet(viewModel),  
        );
      }
    );
  }
}