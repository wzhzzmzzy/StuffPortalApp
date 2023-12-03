import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stuff_portal/common/utils/copy.dart';
import 'package:stuff_portal/models/message.dart';
import 'package:stuff_portal/states/filter_model.dart';

class MessageList extends StatefulWidget {
  const MessageList({ super.key, required MessageSource type, String filterKeyword = '' });

  final String filterKeyword = '';

  @override
  State<StatefulWidget> createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  List<Message> messageList = [
    const Message(
      title: "这是一条消息",
      content: "消息内容：1234"
    ),
    const Message(title: "这是一条消息123")
  ];

  showMessageDetail(BuildContext context, int index) {
    var message = messageList[index];

    if (message.type == MessageType.notification) {
      copyToClipboard(message.title, context, SnackBarAction(label: "复制小字", onPressed: () {
        copyToClipboard(message.content, context);
        Clipboard.setData(ClipboardData(text: message.content));
      }));
    } else {
      showDialog(context: context, builder: (BuildContext context) => AlertDialog(
        title: SelectableText(message.title),
        content: message.content.isNotEmpty
            ? SelectableText(message.content)
            : const Text("<无内容>", style: TextStyle(
            color: Colors.grey
        )),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var filterKeyword = Provider.of<FilterModel>(context).filterKeyword;
    var filterMessageList = messageList.where((value) => value.contains(filterKeyword)).toList();
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) => ListTile(
            enabled: true,
            onTap: () => showMessageDetail(context, index),
            title: Text(filterMessageList[index].title),
            subtitle: filterMessageList[index].content.isEmpty ? null :
              Text(filterMessageList[index].content),
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 0),
        itemCount: filterMessageList.length
    );
  }
}