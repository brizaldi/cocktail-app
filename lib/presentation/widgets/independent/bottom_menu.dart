/*
 * cocktail_app
 * bottom_menu
 * Created by Bahri Rizaldi on 03/06/2020 20:39
 *
 */

import 'package:cocktailapp/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CocktailAppBottomMenu extends StatelessWidget {
  final int menuIndex;

  CocktailAppBottomMenu(this.menuIndex);

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? theme.accentColor : theme.primaryColorLight;
  }

  BottomNavigationBarItem getItem(
      IconData icon, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: colorByIndex(theme, index),
        size: 24.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 10.0,
          color: colorByIndex(theme, index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: menuIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                Navigator.pushNamed(context, Routes.home);
                break;
              case 1:
                Navigator.pushNamed(context, Routes.categories);
                break;
              case 2:
                Navigator.pushNamed(context, Routes.about);
                break;
            }
          },
          items: [
            getItem(FontAwesomeIcons.home, 'Home', _theme, 0),
            getItem(FontAwesomeIcons.cocktail, 'Browse', _theme, 1),
            getItem(FontAwesomeIcons.infoCircle, 'About', _theme, 2),
          ],
        ),
      ),
    );
  }
}