/*
 * cocktail_app
 * cocktail_screen
 * Created by Bahri Rizaldi on 04/06/2020 19:06
 *
 */

import 'dart:collection';

import 'package:cocktailapp/data/model/cocktail_attribute.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/cocktail.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/views/details.dart';
import 'package:cocktailapp/presentation/features/wrapper.dart';
import 'package:cocktailapp/presentation/widgets/independent/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailDetailsScreen extends StatefulWidget {
  final CocktailDetailsParameters parameters;

  const CocktailDetailsScreen(
      this.parameters, {
        Key key,
      }) : super(key: key);

  @override
  _CocktailDetailsScreenState createState() => _CocktailDetailsScreenState();
}

class CocktailDetailsParameters {
  final String cocktailId;
  final String categoryId;
  final HashMap<CocktailAttribute, String> selectedAttributes;

  const CocktailDetailsParameters(this.cocktailId, this.categoryId, {this.selectedAttributes});
}

class _CocktailDetailsScreenState extends State<CocktailDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print('cocktailId: ${widget.parameters.cocktailId}');
    return SafeArea(
        child: CocktailAppScaffold(
          background: null,
          title: null,
          body: BlocProvider<CocktailBloc>(
            create: (context) {
              return CocktailBloc(
                  cocktailId: widget.parameters.cocktailId)
                ..add(CocktailScreenLoadedEvent(
                    cocktailId: widget.parameters.cocktailId,
                    categoryId: widget.parameters.categoryId
                ));
            },
            child: CocktailWrapper(),
          ),
          bottomMenuIndex: 1,
        ));
  }
}

class CocktailWrapper extends StatefulWidget {
  @override
  _CocktailWrapperState createState() => _CocktailWrapperState();
}

class _CocktailWrapperState extends CocktailWrapperState<CocktailWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailBloc, CocktailState>(
      bloc: BlocProvider.of<CocktailBloc>(context),
      builder: (BuildContext context, CocktailState state) {
        if (state is CocktailLoadedState) {
          return CocktailDetailsView(
            cocktail: state.cocktail,
            similarCocktails: state.similarCocktails,
            changeView: changePage,
          );
        }
        return Container();
      },
    );
  }
}