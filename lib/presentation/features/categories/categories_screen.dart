/*
 * cocktail_app
 * filter_screen
 * Created by Bahri Rizaldi on 04/06/2020 8:21
 *
 */

import 'package:cocktailapp/presentation/widgets/independent/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cocktailapp/presentation/features/wrapper.dart';

import 'categories.dart';

class CategoriesScreen extends StatefulWidget {
  final CategoriesParameters parameters;

  const CategoriesScreen({Key key, this.parameters}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class CategoriesParameters {
  final String categoryId;

  const CategoriesParameters(this.categoryId);
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    print('widget parameters at categories screen ${widget.parameters}');
    return SafeArea(
        child: BlocProvider<CategoryBloc>(
            create: (context) {
              return CategoryBloc()
                ..add(CategoryShowListEvent(widget.parameters == null
                    ? 'c'
                    : widget.parameters.categoryId));
            },
            child: CategoriesWrapper()));
  }
}

class CategoriesWrapper extends StatefulWidget {
  @override
  _CategoriesWrapperState createState() => _CategoriesWrapperState();
}

class _CategoriesWrapperState
    extends CocktailWrapperState<CategoriesWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      child: getPageView(<Widget>[
        LoadingView(),
        CategoriesListView(changeView: changePage),
      ]),
      listener: (BuildContext context, CategoryState state) {
        final index = state is CategoryLoadingState
            ? 0
            : state is CategoryListViewState ? 1 : 2;
        changePage(changeType: ViewChangeType.Exact, index: index);
      },
    );
  }
}