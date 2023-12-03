import 'package:flutter/material.dart';
import 'package:stuff_portal/models/message.dart';

class MessageDetail extends StatelessWidget {
  const MessageDetail({ super.key, required this.message });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(message.title)
    );
  }

}