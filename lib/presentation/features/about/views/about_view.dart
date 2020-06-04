/*
 * cocktail_app
 * about_view
 * Created by Bahri Rizaldi on 04/06/2020 22:14
 *
 */

import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Cocktail App",
              style: _theme.textTheme.headline3,
            ),
            SizedBox(height: 10,),
            Text(
              "Created By Bahri Rizaldi",
              style: _theme.textTheme.subtitle2,
            ),
            SizedBox(height: 10,),
            Text(
              "Version 1.0.0+1",
              style: _theme.textTheme.subtitle2,
            ),
            SizedBox(height: 10,),
            Text(
              "https://www.github.com/brizaldi",
              style: _theme.textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}