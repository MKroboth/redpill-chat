import 'package:flutter/cupertino.dart';

import 'dummy_chat_list_entry.dart';

class GroupChatView extends StatefulWidget {
  const GroupChatView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GroupChatViewState();
}

class _GroupChatViewState extends State<GroupChatView> {
  get _itemCount => 20;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: _itemCount,
      );

  Widget _itemBuilder(BuildContext context, int index) {
    return DummyChatListEntry();
  }
}
