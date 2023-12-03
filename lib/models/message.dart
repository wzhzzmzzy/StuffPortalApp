enum MessageSource {
  receive,
  publish
}

enum MessageType {
  notification,
  text,
  media,
  file
}

class Message {
  const Message({
    required this.title,
    this.content = '',
    this.type = MessageType.notification
  });

  final String title;
  final String content;
  final MessageType type;

  bool contains(String value) {
    if (title.contains(value)) return true;
    if (content.contains(value)) return true;
    return false;
  }
}