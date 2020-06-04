/*
 * cocktail_app
 * cocktail_list_view
 * Created by Bahri Rizaldi on 03/06/2020 20:54
 *
 */

import 'package:cocktailapp/config/routes.dart';
import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/cocktail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/cocktail_view.dart';

enum CocktailListSize {
  small,
  big,
}

class CocktailAppCocktailListView extends StatelessWidget {
  final double width;
  final double height = 284;
  final List<Cocktail> cocktails;
  final CocktailListSize size;

  const CocktailAppCocktailListView({
    Key key,
    this.width,
    this.cocktails,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('cocktail list length ${cocktails.length}');
    ScreenUtil.init(context);
    return Container(
      padding: EdgeInsets.only(top: AppSizes.sidePadding),
      width: width,
      height: size == CocktailListSize.small ? height : ScreenUtil.screenHeight - 400,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cocktails.map((cocktail) => cocktail.getTileView(
          context: context,
          size: size,
          showProductInfo: () {
            Navigator.of(context).pushNamed(
              Routes.cocktailDetail,
              arguments: CocktailDetailsParameters(
                cocktail.id,
                cocktail.category,
              ),
            );
          },
        )).toList(growable: false),
      ),
    );
  }
}