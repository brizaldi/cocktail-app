/*
 * cocktail_app
 * cocktails_screen
 * Created by Bahri Rizaldi on 04/06/2020 20:59
 *
 */

import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/size_changing_app_bar.dart';
import 'package:cocktailapp/presentation/widgets/independent/error_dialog.dart';
import 'package:cocktailapp/presentation/widgets/independent/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cocktails.dart';

class CocktailsScreen extends StatefulWidget {
  final CocktailListScreenParameters parameters;

  const CocktailsScreen({Key key, this.parameters}) : super(key: key);

  @override
  _CocktailsScreenState createState() => _CocktailsScreenState();
}

class CocktailListScreenParameters {
  final CocktailCategory category;

  CocktailListScreenParameters(this.category);
}

class _CocktailsScreenState extends State<CocktailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CocktailAppScaffold(
          background: null,
          title: null,
          body: BlocProvider<CocktailsBloc>(
              create: (context) {
                return CocktailsBloc(
                    category: widget.parameters.category)
                  ..add(ScreenLoadedEvent());
              },
              child: BlocConsumer<CocktailsBloc, CocktailsState>(
                listener: (context, state) {
                  if (state.hasError) {
                    ErrorDialog.showErrorDialog(context, state.error);
                  }
                },
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SizeChangingAppBar(
                        title: state.data?.category?.name??'',
                        isListView: state is CocktailsListViewState,
                        onViewChanged: () {
                          BlocProvider.of<CocktailsBloc>(context)
                              .add(CocktailsChangeViewEvent());
                        },
                      ),
                      state is CocktailsListViewState
                          ? CocktailsListView()
                          : CocktailsTileView(),
                    ],
                  );
                },
              )),
          bottomMenuIndex: 1,
        ));
  }
}