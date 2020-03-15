part of add_and_edit_view;

class _AddAndEditTablet extends StatelessWidget {
  final AddAndEditViewModel viewModel;

  _AddAndEditTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AddAndEditTablet')),
    );
  }
}