part of add_and_edit_view;

List<Step> steps = [
    Step(
      title: const Text('New Account'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),
    Step(
      state: StepState.error,
      title: const Text('Avatar'),
      subtitle: const Text("Error!"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];

class _AddAndEditMobile extends StatelessWidget {
  final AddAndEditViewModel viewModel;
  final titleController = TextEditingController();
  _AddAndEditMobile(this.viewModel);
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Stepper(
          steps: steps,
          currentStep: viewModel.currentStep,
          onStepContinue: viewModel.next,
          onStepTapped: (step) => viewModel.goTo(step),
          onStepCancel: viewModel.cancel,
          ),
        ),
      ]));
  }
}