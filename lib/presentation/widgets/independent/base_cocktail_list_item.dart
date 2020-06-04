/*
 * cocktail_app
 * base_cocktail_list_item
 * Created by Bahri Rizaldi on 04/06/2020 5:42
 *
 */

import 'package:cocktailapp/config/theme.dart';
import 'package:flutter/material.dart';

class BaseCocktailListItem extends StatelessWidget {
  final VoidCallback onClick;
  final ImageProvider image;
  final WidgetBuilder mainContentBuilder;
  final double imageHeight;
  final double imageWidth;

  const BaseCocktailListItem(
      {Key key,
        this.onClick,
        this.image,
        this.mainContentBuilder,
        this.imageHeight = 125,
        this.imageWidth = 125})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: imageHeight + 30,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.widgetSidePadding / 2),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: onClick,
            child: Container(
              height: imageHeight,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: imageWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        image: image == null
                            ? null
                            : DecorationImage(
                            image: image, fit: BoxFit.cover),
                        color: AppColors.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.imageRadius),
                          bottomLeft: Radius.circular(AppSizes.imageRadius),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(11.0),
                        child: mainContentBuilder(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}