/*
 * cocktail_app
 * category_list_element
 * Created by Bahri Rizaldi on 04/06/2020 9:33
 *
 */

import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/data/model/category.dart';
import 'package:flutter/material.dart';

class CocktailAppCategoryListElement extends StatelessWidget {
  final CocktailCategory category;

  const CocktailAppCategoryListElement({Key key, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: AppSizes.sidePadding,
            bottom: AppSizes.sidePadding,
            left: AppSizes.sidePadding * 2,
            right: AppSizes.sidePadding),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _theme.primaryColorLight, width: 0.4),
          ),
        ),
        child: Text(category.name,
            style: _theme.textTheme.display1
                .copyWith(fontWeight: FontWeight.normal)));
  }
}