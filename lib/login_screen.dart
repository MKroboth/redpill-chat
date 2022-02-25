import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:ncom/ctx_theme/theme/dynamic_theme.dart';
import 'package:provider/provider.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    Key? key,
    this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  }) : super(key: key);

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors!,
          begin: begin,
          end: end,
          stops: const [0, 1],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<String?>? _onLogin(LoginData loginData) async {}

  LoginTheme _loginThemeFromDynamicTheme(DynamicTheme theme) => LoginTheme(
        primaryColor: theme.login.primaryColor,
        accentColor: theme.login.accentColor,
        errorColor: theme.login.errorColor,
        pageColorDark: theme.login.pageColorDark,
        pageColorLight: theme.login.pageColorLight,
      );

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    const cardInitialHeight = 500;
    const cardWidth = 300;
    final cardTopPosition = deviceSize.height / 2 - cardInitialHeight / 2;
    final cardLeft = deviceSize.width / 2 - cardWidth;
    final cardRight = cardLeft;

    return Consumer<DynamicTheme>(
      builder: (context, theme, _) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBox(
              colors: [
                theme.login.pageColorLight,
                theme.login.pageColorDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(
                    top: cardTopPosition,
                    left: cardLeft,
                    right: cardRight,
                    bottom: cardTopPosition),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(child: LoginForm(theme: theme)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final DynamicTheme theme;
  const LoginForm({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) => Form(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.alternate_email),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: TextFormField(),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.vpn_key),
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              MaterialButton(
                  child: const Text("Login"),
                  color: theme.primaryColor,
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed("/"))
            ],
          ),
        ),
      );
}
