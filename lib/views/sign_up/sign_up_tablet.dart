part of sign_up_view;

class _SignUpTablet extends StatelessWidget {
  final SignUpViewModel viewModel;

  _SignUpTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SignUpTablet')),
    );
  }
}