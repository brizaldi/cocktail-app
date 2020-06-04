/*
 * cocktail_app
 * tile_view
 * Created by Bahri Rizaldi on 04/06/2020 9:21
 *
 */

import 'package:cocktailapp/config/routes.dart';
import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/presentation/features/cocktails/cocktails_screen.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/category_list_element.dart';
import 'package:cocktailapp/presentation/widgets/independent/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categories.dart';

class CategoriesListView extends StatefulWidget {
  final Function changeView;

  const CategoriesListView({Key key, this.changeView}) : super(key: key);

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView>
    with SingleTickerProviderStateMixin {
  final List<String> types = ['Categories', 'Glasses', 'Alcoholics'];
  final List<String> categoryIds = ['c', 'g', 'a'];

  //TODO implements TabBar for each category types
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return BlocListener<CategoryBloc, CategoryState>(
        condition: (context, state) {
          return state is CategoryErrorState;
        }, listener: (BuildContext context, CategoryState state) {
      return Container(
          padding: EdgeInsets.all(AppSizes.sidePadding),
          child: Text('An error occured',
              style: _theme.textTheme.display1
                  .copyWith(color: _theme.errorColor)));
    }, child:
    BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryListViewState) {
        var tabViews = <Widget>[];
        for (var _ in categoryIds) {
          tabViews.add(
            SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(AppSizes.sidePadding),
                  child: Column(
                    children: buildCategoryList(
                      state.categories, width - AppSizes.sidePadding * 3,
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
        return SafeArea(
          child: CocktailAppScaffold(
            background: null,
            title: 'Browse',
            bottomMenuIndex: 1,
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(AppSizes.sidePadding),
                  child: Column(
                    children: buildCategoryList(
                      state.categories, width - AppSizes.sidePadding * 3,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      }
      return Center(child: CircularProgressIndicator());
    }));
  }

  List<Widget> buildCategoryList(List<CocktailCategory> categories, double width) {
    var elements = <Widget>[];
    for (var i = 0; i < categories.length; i++) {
      elements.add(
        InkWell(
          onTap: (() {
            Navigator.of(context).pushNamed(
              Routes.cocktails,
              arguments: CocktailListScreenParameters(categories[i]),
            );
          }),
          child: CocktailAppCategoryListElement(category: categories[i]),
        ),
      );
    }
    return elements;
  }
}