/*
 * cocktail_app
 * expansion_tile
 * Created by Bahri Rizaldi on 04/06/2020 19:49
 *
 */

import 'package:flutter/material.dart';

class CocktailAppExpansionTile extends StatelessWidget {
  final String title;
  final Widget content;

  CocktailAppExpansionTile({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          alignment: Alignment.centerLeft,
          child: content,
        )
      ],
    );
  }
}