/*
 * cocktail_app
 * home_view.dart
 * Created by Bahri Rizaldi on 03/06/2020 20:48
 *
 */

import 'package:cocktailapp/config/routes.dart';
import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/presentation/features/categories/categories_screen.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/cocktail_list_view.dart';
import 'file:///C:/Projects/Android/cocktail_app/lib/presentation/widgets/independent/block_header.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final List<Cocktail> cocktails;

  const HomeView({Key key, this.cocktails}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CocktailAppBlockHeader(
            width: widgetWidth,
            title: 'Cocktail',
            linkText: 'View All',
            onLinkTap: () => {
              Navigator.of(context).pushNamed(
                Routes.categories,
                arguments: CategoriesParameters('c'),
              ),
            },
            description: 'You’ve never seen it before!',
          ),
          CocktailAppCocktailListView(
            width: widgetWidth,
            cocktails: widget.cocktails,
            size: CocktailListSize.big,
          ),
        ],
      ),
    );
  }
}