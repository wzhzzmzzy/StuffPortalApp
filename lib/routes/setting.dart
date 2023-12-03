import 'package:flutter/material.dart';

class SettingRoute extends StatelessWidget {
  const SettingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => const ListTile(
        title: Text("服务器地址")
      )
    );
  }
}