import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stuff_portal/common/utils/global.dart';
import 'package:stuff_portal/routes/setting.dart';
import 'package:stuff_portal/states/locale_model.dart';
import 'package:stuff_portal/states/theme_model.dart';
import 'routes/home.dart';
import 'generated/l10n.dart';

void main() {
  Global.init().then((value) => runApp(const StuffPortalApp()));
}

class StuffPortalApp extends StatelessWidget {
  const StuffPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: Consumer2<LocaleModel, ThemeModel>(
        builder: (BuildContext context, localeModel, themeModel, child) {
          return MaterialApp(
            locale: localeModel.getLocale(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (localeModel.getLocale() != null) {
                // 如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                // 跟随系统
                Locale currentLocale;
                if (supportedLocales.contains(locale)) {
                  currentLocale = locale!;
                } else {
                  // 如果系统语言不是中文简体或美国英语，则默认使用美国英语
                  currentLocale = const Locale('zh', 'CN');
                }
                return currentLocale;
              }
            },
            supportedLocales: S.delegate.supportedLocales,
            title: 'Stuff Portal',
            theme: ThemeData(
              primarySwatch: themeModel.theme,
              useMaterial3: true,
            ),
            home: const HomeRoute(),
            routes: <String, WidgetBuilder>{
              "setting": (context) => const SettingRoute(),
            },
          );
        },
      ),
    );
  }
}
