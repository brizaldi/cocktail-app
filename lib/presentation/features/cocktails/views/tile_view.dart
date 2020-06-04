/*
 * cocktail_app
 * tile_view
 * Created by Bahri Rizaldi on 04/06/2020 20:59
 *
 */

import 'package:cocktailapp/config/routes.dart';
import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/cocktail_screen.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/cocktail_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cocktailapp/presentation/widgets/extensions/cocktail_view.dart';

import '../cocktails.dart';

class CocktailsTileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailsBloc, CocktailsState>(builder: (context, state) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: AppSizes.tile_width / AppSizes.tile_height,
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                child: state.data.cocktails[index].getTileView(
                  context: context,
                  size: CocktailListSize.small,
                  showProductInfo: () {
                    Navigator.of(context).pushNamed(
                        Routes.cocktailDetail,
                        arguments: CocktailDetailsParameters(
                            state.data.cocktails[index].id,
                            state.data.category.id));
                  },
                ));
          },
          childCount: state.data.cocktails.length,
        ),
      );
    });
  }
}