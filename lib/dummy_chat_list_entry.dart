import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:ncom/ctx_theme/theme/dynamic_theme.dart';
import 'package:provider/provider.dart';

class DummyChatListEntry extends StatelessWidget {
  const DummyChatListEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<DynamicTheme>(
        builder: (context, theme, _) => ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: FlutterLogo(),
          ),
          title: Column(
            children: const [
              PlaceholderLines(
                count: 1,
                lineHeight: 11,
              ),
              Padding(padding: EdgeInsets.all(3)),
              PlaceholderLines(
                count: 1,
                lineHeight: 8,
              )
            ],
          ),
        ),
      );
}
