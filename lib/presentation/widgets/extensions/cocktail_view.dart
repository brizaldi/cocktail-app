/*
 * cocktail_app
 * cocktail_view.dart
 * Created by Bahri Rizaldi on 04/06/2020 5:42
 *
 */

import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/cocktail_list_view.dart';
import 'package:cocktailapp/presentation/widgets/independent/base_cocktail_list_item.dart';
import 'package:cocktailapp/presentation/widgets/independent/base_cocktail_tile.dart';
import 'package:flutter/material.dart';
import 'cocktail_image_view.dart';

extension View on Cocktail {
  Widget getListView(
      {@required BuildContext context,
        @required VoidCallback showProductInfo,}) {
    return BaseCocktailListItem(
      onClick: showProductInfo,
      image: mainImage?.getView(),
      mainContentBuilder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(name, style: Theme.of(context).textTheme.display1),
          ],
        );
      },
    );
  }

  Widget getTileView(
  {
    @required BuildContext context,
    @required VoidCallback showProductInfo,
    @required CocktailListSize size,
  }) {
    return BaseCocktailTile(
      onClick: showProductInfo,
      size: size,
      image: mainImage.getView(),
      mainContentBuilder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(name, style: Theme.of(context).textTheme.display1),
            ),
          ],
        );
      },
    );
  }
}