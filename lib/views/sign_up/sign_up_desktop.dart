part of sign_up_view;

class _SignUpDesktop extends StatelessWidget {
  final SignUpViewModel viewModel;

  _SignUpDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SignUpDesktop')),
    );
  }
}