import 'package:flutter/cupertino.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:ncom/ctx_theme/theme/dynamic_theme.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) => Consumer<DynamicTheme>(
        builder: (context, theme, _) => FlutterLogin(
          onLogin: _onLogin,
          theme: _loginThemeFromDynamicTheme(theme),
          title: "Login to [matrix]",
          hideForgotPasswordButton: true,
          onRecoverPassword: (_) async => "Password recovery not supported",
          onSubmitAnimationCompleted: (_) => "e",
        ),
      );
}
