/*
 * cocktail_app
 * cocktails_bloc
 * Created by Bahri Rizaldi on 04/06/2020 21:00
 *
 */

import 'package:bloc/bloc.dart';
import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/domain/usecases/cocktails/cocktails_by_filter_params.dart';
import 'package:cocktailapp/domain/usecases/cocktails/cocktails_by_filter_result.dart';
import 'package:cocktailapp/domain/usecases/cocktails/find_cocktails_by_filter_use_case.dart';
import 'package:cocktailapp/locator.dart';
import 'package:flutter/material.dart';

import 'bloc_list_data.dart';
import 'cocktails.dart';

class CocktailsBloc extends Bloc<CocktailsListEvent, CocktailsState> {
  final FindCocktailsByFilterUseCase findCocktailsByFilterUseCase;

  final CocktailCategory category;

  CocktailsBloc({
    @required this.category,
  }) : findCocktailsByFilterUseCase = sl();

  @override
  CocktailsState get initialState => CocktailsListViewState();

  @override
  Stream<CocktailsState> mapEventToState(CocktailsListEvent event) async* {
    if (event is ScreenLoadedEvent) {
      CocktailListData data = await getInitialStateData(category);
      yield CocktailsListViewState(data: data);
    } else if (event is CocktailsChangeViewEvent) {
      if (state is CocktailsListViewState) {
        yield (state as CocktailsListViewState).getTiles();
      } else {
        yield (state as CocktailsTileViewState).getList();
      }
    }
  }

  Future<CocktailListData> getInitialStateData(CocktailCategory category) async {
    CocktailsByFilterResult cocktailResults = await findCocktailsByFilterUseCase.execute(
      CocktailsByFilterParams(categoryId: category.id),
    );
    return CocktailListData(
      cocktailResults.cocktails,
      category,
    );
  }
}