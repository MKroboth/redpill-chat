import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:ncom/ctx_theme/theme/dynamic_theme.dart';
import 'package:provider/provider.dart';

import 'ctx_theme/widget/ctx_scaffold.dart';
import 'direct_chat_view.dart';
import 'group_view.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  static const _kTabLength = 2;

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: _kTabLength,
        child: CTXScaffold(
          child: const TabBarView(
            children: [
              DirectChatView(),
              GroupChatView(),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () => Navigator.pushNamed(context, "/settings"),
                )
              ],
            ),
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.black38,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.group,
                  color: Colors.black38,
                ),
              )
            ],
          ),
        ),
      );
}
