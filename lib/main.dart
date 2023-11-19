import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stuff_portal/models/global_model.dart';
import 'widgets/layout/app_layout.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const StuffPortalApp());
}

class StuffPortalApp extends StatelessWidget {
  const StuffPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GlobalModel(),
        child: MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Stuff Portal',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: AppLayout(child: Consumer<GlobalModel>(
            builder: (BuildContext context, GlobalModel value, Widget? child) {
              return Text(value.filterKeyword);
            }
          ))
        )
    );
  }
}
