part of add_and_edit_view;

class _AddAndEditDesktop extends StatelessWidget {
  final AddAndEditViewModel viewModel;

  _AddAndEditDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AddAndEditDesktop')),
    );
  }
}