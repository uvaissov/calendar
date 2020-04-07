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
    ListItem(code: 'year', name: AppLocalizations.of(context).translate("edit.period.year")),
    ListItem(code: 'quarter', name: AppLocalizations.of(context).translate("edit.period.quarter")),
    ListItem(code: 'month', name: AppLocalizations.of(context).translate("edit.period.month")),
    ListItem(code: 'week', name: AppLocalizations.of(context).translate("edit.period.week")),
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
                    placeholder: AppLocalizations.of(context).translate("edit.period.title"),
                    onItemSelected: viewModel.selectPeriod,
                    items: periods,                    
                    additionalNote: AppLocalizations.of(context).translate("edit.period.title"),
                  ),
                  verticalSpaceMedium,
                  InputField( 
                      initialValue: viewModel.periodCount,
                      onChanged: (v) => viewModel.periodCount = v,
                      textInputType: TextInputType.number,
                      formatter:  WhitelistingTextInputFormatter.digitsOnly,
                      placeholder: AppLocalizations.of(context).translate("edit.period.periodCount"),
                      additionalNote: AppLocalizations.of(context).translate("edit.period.periodCount"),
                      ),
                  verticalSpaceSmall,
                  InputField(
                      initialValue: viewModel.perPeriodSum,
                      onChanged: (v) => viewModel.perPeriodSum = v,
                      textInputType: TextInputType.number,
                      formatter:  WhitelistingTextInputFormatter.digitsOnly,
                      placeholder: AppLocalizations.of(context).translate("edit.period.perPeriodSum"),
                      additionalNote: AppLocalizations.of(context).translate("edit.period.perPeriodSum"),
                      ),
                ],
              ),
            ),
            Step(
              isActive: viewModel.currentStep == 1,
              state: viewModel.currentStep == 1 ? StepState.editing : StepState.indexed,
              title: const Text('Календарь',style: stepTitleTextStyle),
              subtitle: Text('Календарь платежей',style: stepSubTitleTextStyle),
              content: Column(
                children: <Widget>[
                  DateField( 
                      value: viewModel.firstPayDate,
                      onChanged: (v) => viewModel.firstPayDate = v,
                      textInputType: TextInputType.datetime,
                      //formatter:  WhitelistingTextInputFormatter.digitsOnly,
                      placeholder: AppLocalizations.of(context).translate("edit.period.firstPayDate"),
                      additionalNote: AppLocalizations.of(context).translate("edit.period.firstPayDate"),
                      ),
                  verticalSpaceSmall,
                  InputField(
                      initialValue: viewModel.perPeriodSum,
                      onChanged: (v) => viewModel.perPeriodSum = v,
                      textInputType: TextInputType.number,
                      formatter:  WhitelistingTextInputFormatter.digitsOnly,
                      placeholder: AppLocalizations.of(context).translate("edit.period.perPeriodSum"),
                      additionalNote: AppLocalizations.of(context).translate("edit.period.perPeriodSum"),
                      ),
                ],
              ),
            ),
            Step(
              isActive: viewModel.currentStep == 2,
              state: viewModel.currentStep == 2 ? StepState.editing : StepState.indexed,
              title: const Text('Описание', style: stepTitleTextStyle),
              subtitle: Text('Дополнительная информация',style: stepSubTitleTextStyle),
              content: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  )
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
