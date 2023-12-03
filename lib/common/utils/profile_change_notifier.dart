import 'package:flutter/material.dart';

import 'global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}