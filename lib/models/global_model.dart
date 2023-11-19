import 'package:flutter/cupertino.dart';

class GlobalModel extends ChangeNotifier {
  late String _filterKeyword = '';

  String get filterKeyword => _filterKeyword;

  void updateKeyword (String v) {
    _filterKeyword = v;
    notifyListeners();
  }
}