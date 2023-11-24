import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuff_portal/models/global_model.dart';

enum MessageType {
  receive,
  publish
}

class MessageList extends StatefulWidget {
  const MessageList({ super.key, required MessageType type, String filterKeyword = '' });

  final String filterKeyword = '';

  @override
  State<StatefulWidget> createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  List<String> messageList = [
    "这是一条消息",
    "这是一条消息123"
  ];

  @override
  Widget build(BuildContext context) {
    var filterKeyword = Provider.of<GlobalModel>(context).filterKeyword;
    return ListView(
      children: messageList
        .where((value) => value.contains(filterKeyword))
        .map((message) => Container(
          child: Text(message),
        )).toList(),
    );
  }
}