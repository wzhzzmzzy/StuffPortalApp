import 'package:flutter/material.dart';
import 'package:stuff_portal/models/global_model.dart';
import 'package:stuff_portal/widgets/layout/app_drawer.dart';
import 'package:stuff_portal/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../message/message_list.dart';

var tabs = <MessageType>[
  MessageType.receive,
  MessageType.publish
];

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {

          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const SearchBar(),
            bottom: TabBar(
              tabs: tabs.map((e) => Tab(
                text: e == MessageType.receive
                  ? S.of(context).tabNameReceiver
                  : S.of(context).tabNamePublished
              )).toList(),
            ),
          ),
          drawer: const AppDrawer(),
          body: TabBarView(
            children: tabs.map((e) => MessageList(type: e)).toList(),
          )
        );
      })
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<StatefulWidget> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  bool focusing = false;

  FocusNode focusNode = FocusNode();

  @override
  initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        focusing = focusNode.hasFocus;
      });
    });
  }

  void onKeywordChange(v) {
    Provider.of<GlobalModel>(context, listen: false).updateKeyword(v);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onKeywordChange,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: !focusing,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black45),
          borderRadius: BorderRadius.circular(25),
        ),
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        hintText: S.of(context).searchBarPlaceholder,
      ),
    );
  }
}