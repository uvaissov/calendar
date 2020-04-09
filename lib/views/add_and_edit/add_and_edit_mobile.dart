part of add_and_edit_view;

class _AddAndEditMobile extends StatelessWidget {
  final AddAndEditViewModel viewModel;
  
  _AddAndEditMobile(this.viewModel);
  @override
  Widget build(BuildContext context) {
    Function controlsBuilder = (BuildContext context,
        {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
      return Column(
        children: <Widget>[
          verticalSpaceMedium,
          Row(
            children: <Widget>[
              BusyButton(title: 'ДАЛЕЕ', onPressed: onStepContinue),
              horizontalSpaceMedium,
              BusyButton(title: 'НАЗАД', onPressed: onStepCancel),
            ],
          ),
        ],
      );
    };

    List<ListItem> periods = [
    ListItem(code: 'year', name: AppLocalizations.of(context).translate("edit.year")),
    ListItem(code: 'quarter', name: AppLocalizations.of(context).translate("edit.quarter")),
    ListItem(code: 'month', name: AppLocalizations.of(context).translate("edit.month")),
    ListItem(code: 'week', name: AppLocalizations.of(context).translate("edit.week")),
    ];

    

    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
        child: Stepper(
          controlsBuilder: controlsBuilder,
          steps: [
            Step(
              title: const Text('Платежи' ,style: stepTitleTextStyle,),
              subtitle: Text('Информация о платежах',style: stepSubTitleTextStyle),
              isActive: viewModel.currentStep == 0,
              state: viewModel.currentStep == 0 ? StepState.editing : StepState.indexed,              
              content: Column(
                children: <Widget>[
                  ExpansionList(
                    placeholder: AppLocalizations.of(context).translate("edit.period"),
                    onItemSelected: viewModel.selectPeriod,
                    items: periods,                    
                    additionalNote: AppLocalizations.of(context).translate("edit.period"),
                  ),
                  verticalSpaceMedium,
                  InputField( 
                      initialValue: viewModel.periodCount,
                      onChanged: (v) => viewModel.periodCount = v,
                      textInputType: TextInputType.number,
                      formatter:  WhitelistingTextInputFormatter.digitsOnly,
                      placeholder: AppLocalizations.of(context).translate("edit.periodCount"),
                      additionalNote: AppLocalizations.of(context).translate("edit.periodCount"),
                      ),
                  verticalSpaceSmall,
                  InputField(
                      initialValue: viewModel.perPeriodSum,
                      onChanged: (v) => viewModel.perPeriodSum = v,
                      textInputType: TextInputType.number,
                      formatter:  WhitelistingTextInputFormatter.digitsOnly,
                      placeholder: AppLocalizations.of(context).translate("edit.perPeriodSum"),
                      additionalNote: AppLocalizations.of(context).translate("edit.perPeriodSum"),
                      ),
                ],
              ),
            ),
            Step(
              isActive: viewModel.currentStep == 1,
              state: viewModel.currentStep == 1 ? StepState.editing : StepState.indexed,
              title: Text(AppLocalizations.of(context).translate("edit.calendar") ,style: stepTitleTextStyle),
              subtitle: Text(AppLocalizations.of(context).translate("edit.calendarDesc") ,style: stepSubTitleTextStyle),
              content: Column(
                children: <Widget>[
                  DateField( 
                      value: viewModel.firstPayDate,
                      onChanged: (v) => viewModel.firstPayDate = v,
                      textInputType: TextInputType.datetime,
                      //formatter:  WhitelistingTextInputFormatter.digitsOnly,
                      placeholder: AppLocalizations.of(context).translate("edit.firstPayDate"),
                      additionalNote: AppLocalizations.of(context).translate("edit.firstPayDate"),
                  ),
                  verticalSpaceSmall,
                  CheckBoxField(smallVersion: true, placeholder: AppLocalizations.of(context).translate("edit.weekendWork"), initialValue: viewModel.weekendHoliday, onChanged: (v) => viewModel.weekendHoliday = v,),
                  verticalSpaceSmall,
                  CheckBoxField(smallVersion: true, placeholder: AppLocalizations.of(context).translate("edit.saturdayWork"), initialValue: viewModel.saturdayWork, onChanged: (v) => viewModel.saturdayWork = v,),
                ],
              ),
            ),
            Step(
              isActive: viewModel.currentStep == 2,
              state: viewModel.currentStep == 2 ? StepState.editing : StepState.indexed,
              title: Text(AppLocalizations.of(context).translate("edit.description"), style: stepTitleTextStyle),
              subtitle: Text(AppLocalizations.of(context).translate("edit.descriptionSubtitle"),style: stepSubTitleTextStyle),
              content: Column(
                children: <Widget>[
                  InputField(
                      initialValue: viewModel.name,
                      onChanged: (v) => viewModel.name = v,
                      textInputType: TextInputType.text,
                      placeholder: AppLocalizations.of(context).translate("edit.name"),
                      additionalNote: AppLocalizations.of(context).translate("edit.name"),
                  ),
                  verticalSpaceSmall,
                  InputField(
                      initialValue: viewModel.nameBank,
                      onChanged: (v) => viewModel.nameBank = v,
                      textInputType: TextInputType.text,
                      placeholder: AppLocalizations.of(context).translate("edit.nameBank"),
                      additionalNote: AppLocalizations.of(context).translate("edit.nameBank"),
                  ),
                  verticalSpaceSmall,
                  InputField(
                      initialValue: viewModel.description,
                      onChanged: (v) => viewModel.description = v,
                      textInputAction: TextInputAction.newline,
                      textInputType: TextInputType.multiline,
                      multiline: true,
                      placeholder: AppLocalizations.of(context).translate("edit.descriptionLabel"),
                      additionalNote: AppLocalizations.of(context).translate("edit.descriptionLabel"),
                  ),
                ],
              ),
            ),
          ],
          currentStep: viewModel.currentStep,
          onStepContinue: viewModel.next,
          onStepTapped: (step) => viewModel.goTo(step),
          onStepCancel: viewModel.cancel,
        ),
      ),
    ]));
  }
}
