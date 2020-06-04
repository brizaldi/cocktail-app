/*
 * cocktail_app
 * list_view
 * Created by Bahri Rizaldi on 04/06/2020 20:59
 *
 */

import 'package:cocktailapp/config/routes.dart';
import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/cocktail_screen.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/blank_cocktail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cocktailapp/presentation/widgets/extensions/cocktail_view.dart';

import '../cocktails.dart';

class CocktailsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailsBloc, CocktailsState>(builder: (context, state) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            if (state.data == null) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                child: BlankCocktailListItem(),
              );
            } else {
              return Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                  child: state.data.cocktails[index].getListView(
                    context: context,
                    showProductInfo: () {
                      Navigator.of(context).pushNamed(
                          Routes.cocktailDetail,
                          arguments: CocktailDetailsParameters(
                              state.data.cocktails[index].id,
                              state.data.category?.id));
                    },
                  )) ;
            }
          },
          childCount: state.data?.cocktails?.length ?? 20,
        ),
      );
    });
  }
}