import 'dart:ui';

import 'package:stuff_portal/common/utils/global.dart';
import 'package:stuff_portal/common/utils/profile_change_notifier.dart';

class LocaleModel extends ProfileChangeNotifier {
  Locale? getLocale() {
    if (Global.profile.locale == 'system') return null;
    var t = Global.profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => Global.profile.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (locale != Global.profile.locale) {
      Global.profile.locale = locale;
      notifyListeners();
    }
  }
}