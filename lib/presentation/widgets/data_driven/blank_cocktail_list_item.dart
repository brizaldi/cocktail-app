/*
 * cocktail_app
 * blank_product_list_item
 * Created by Bahri Rizaldi on 04/06/2020 21:33
 *
 */

import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/presentation/widgets/independent/base_cocktail_list_item.dart';
import 'package:flutter/material.dart';

class BlankCocktailListItem extends BaseCocktailListItem {
  BlankCocktailListItem()
      : super(
    mainContentBuilder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildGrey(115, 21),
          _buildGrey(38, 11),
          _buildGrey(91, 14),
          _buildGrey(23, 15),
        ],
      );
    },
  );

  static Widget _buildGrey(double width, double height) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
      ),
    );
  }
}