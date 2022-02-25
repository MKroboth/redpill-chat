import 'package:flutter/material.dart';
import 'package:ncom/dummy_chat_list_entry.dart';

class DirectChatView extends StatefulWidget {
  const DirectChatView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DirectChatViewState();
}

class _DirectChatViewState extends State<DirectChatView> {
  get _itemCount => 20;

  @override
  Widget build(BuildContext context) =>
      ListView.builder(itemBuilder: _itemBuilder, itemCount: _itemCount);

  Widget _itemBuilder(BuildContext context, int index) {
    return DummyChatListEntry();
  }
}
