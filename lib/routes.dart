import 'package:flutter/cupertino.dart';
import 'package:ncom/account_settings_screen.dart';
import 'package:ncom/login_screen.dart';
import 'package:ncom/options_screen.dart';
import 'package:ncom/overview_screen.dart';

class Routes {
  static Widget loginBuilder(BuildContext context) => const LoginScreen();
  static Widget overviewBuilder(BuildContext context) => const OverviewScreen();
  static Widget settingsBuilder(BuildContext context) => const OptionsScreen();
  static Widget accountSettingsBuilder(BuildContext context) =>
      const AccountSettingsScreen();
}
