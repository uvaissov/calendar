part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _LoginMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          //backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                  //child: Image.asset('assets/images/title.png'),
                  child: FlutterLogo(size: 120,),
                ),
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Пароль',
                  password: true,
                  controller: passwordController,
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      title: 'Войти',
                      busy: viewModel.busy,
                      onPressed: () {
                        viewModel.login(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        );
                      },
                    )
                  ],
                ),
                verticalSpaceMedium,
                TextLink(
                  'Create an Account if you\'re new.',
                  onPressed: () {
                    viewModel.navigateToSignUp();
                  },
                )
              ],
            ),
          ));
  }
}