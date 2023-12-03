import 'package:flutter/material.dart';

class FilterModel extends ChangeNotifier {
  late String _filterKeyword = '';

  String get filterKeyword => _filterKeyword;

  void updateKeyword (String v) {
    _filterKeyword = v;
    notifyListeners();
  }
}