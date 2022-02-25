import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:ncom/ctx_theme/theme/dynamic_theme.dart';
import 'package:ncom/ctx_theme/widget/ctx_scaffold.dart';
import 'package:provider/provider.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CTXScaffold(
        appBar: AppBar(),
        child: const Placeholder(),
      );
}
