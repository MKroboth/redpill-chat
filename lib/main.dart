import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ncom/login_screen.dart';
import 'package:ncom/routes.dart';
import 'package:ncom/ctx_theme/theme/dynamic_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const NCOMApp());
}

class NCOMApp extends StatelessWidget {
  const NCOMApp({Key? key}) : super(key: key);

  static const routes = <String, Widget Function(BuildContext)>{
    "/login": Routes.loginBuilder,
    "/": Routes.overviewBuilder,
    "/settings": Routes.settingsBuilder,
    "/accountSettings": Routes.accountSettingsBuilder,
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext ctx) => FutureBuilder<DynamicTheme>(
        builder: (ctx, sn) {
          if (sn.hasData) {
            return buildWithTheme(sn.data!, ctx);
          } else if (sn.hasError) {
            print(sn.error!);
            return const Placeholder();
          } else {
            return const Placeholder();
          }
        },
        future: rootBundle.loadStructuredData(
            DynamicTheme.defaultAssetPath, DynamicTheme.fromYAML),
      );

  Widget buildWithTheme(DynamicTheme theme, BuildContext context) {
    return ChangeNotifierProvider<DynamicTheme>(
      create: (_) => theme,
      builder: (ctx, _) => Consumer<DynamicTheme>(
        builder: (context, td, _) => MaterialApp(
          theme: td.materialLightTheme,
          darkTheme: td.materialDarkTheme,
          initialRoute: "/login",
          routes: routes,
        ),
      ),
    );
  }
}
