import 'package:flutter/material.dart';
import 'package:ncom/ctx_theme/theme/dynamic_theme.dart';
import 'package:provider/provider.dart';

class CTXScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  const CTXScaffold(
      {Key? key,
      required this.child,
      this.bottomNavigationBar,
      this.drawer,
      this.appBar})
      : super(key: key);

  Widget _buildChild(BuildContext context, DynamicTheme theme, Widget? c) =>
      Scaffold(
        appBar: appBar ?? AppBar(),
        body: c ?? child,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
      );

  @override
  Widget build(BuildContext context) => Consumer<DynamicTheme>(
        builder: _buildChild,
        child: child,
      );
}
