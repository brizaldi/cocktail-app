/*
 * cocktail_app
 * scaffold
 * Created by Bahri Rizaldi on 03/06/2020 20:38
 *
 */

import 'file:///C:/Projects/Android/cocktail_app/lib/presentation/widgets/independent/bottom_menu.dart';
import 'package:flutter/material.dart';

class CocktailAppScaffold extends StatelessWidget {
  final Color background;
  final String title;
  final Widget body;
  final int bottomMenuIndex;
  final List<String> tabBarList;
  final TabController tabController;

  const CocktailAppScaffold(
      {Key key,
        this.background,
        @required this.title,
        @required this.body,
        @required this.bottomMenuIndex,
        this.tabBarList,
        this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabBars = <Tab>[];
    var _theme = Theme.of(context);
    if (tabBarList != null) {
      for (var i = 0; i < tabBarList.length; i++) {
        tabBars.add(Tab(key: UniqueKey(), text: tabBarList[i]));
      }
    }
    Widget tabWidget = tabBars.isNotEmpty
        ? TabBar(
        unselectedLabelColor: _theme.primaryColor,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        labelColor: _theme.primaryColor,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs: tabBars,
        controller: tabController,
        indicatorColor: _theme.accentColor,
        indicatorSize: TabBarIndicatorSize.tab)
        : null;
    return Scaffold(
      backgroundColor: background,
      appBar: title != null
          ? AppBar(title: Text(title), bottom: tabWidget)
          : null,
      body: body,
      bottomNavigationBar: CocktailAppBottomMenu(bottomMenuIndex),
    );
  }
}