/*
 * cocktail_app
 * base_cocktail_tile
 * Created by Bahri Rizaldi on 04/06/2020 6:08
 *
 */

import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/cocktail_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class BaseCocktailTile extends StatelessWidget {
  final VoidCallback onClick;
  final ImageProvider image;
  final WidgetBuilder mainContentBuilder;
  final double imageHeight;
  final double imageWidth;
  final double tileHeight;
  final CocktailListSize size;

  const BaseCocktailTile(
      {Key key,
        this.onClick,
        this.image,
        this.mainContentBuilder,
        this.imageHeight = 184,
        this.imageWidth = AppSizes.tile_width,
        this.tileHeight = AppSizes.tile_height,
        this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
//      width: imageWidth + AppSizes.widgetSidePadding,
      width: size == CocktailListSize.small
          ? imageWidth + AppSizes.widgetSidePadding
          : ScreenUtil.screenWidth / 2,
      height: size == CocktailListSize.small
          ? tileHeight
          : ScreenUtil.screenHeight - 400,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.widgetSidePadding / 2),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: onClick,
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                  ),
                  child: Container(
                    width: size == CocktailListSize.small
                        ? imageWidth
                        : ScreenUtil.screenWidth / 2,
                    height: size == CocktailListSize.small
                        ? imageHeight
                        : ScreenUtil.screenHeight - 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: image, fit: BoxFit.cover),
                      color: AppColors.background,
                      borderRadius:
                      BorderRadius.circular(AppSizes.imageRadius),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: mainContentBuilder(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}