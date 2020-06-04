/*
 * cocktail_app
 * cocktail_bloc.dart
 * Created by Bahri Rizaldi on 04/06/2020 19:11
 *
 */

import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:cocktailapp/data/model/cocktail_attribute.dart';
import 'package:cocktailapp/domain/usecases/cocktails/get_cocktail_by_id_use_case.dart';
import 'package:cocktailapp/locator.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/cocktail_event.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  final GetCocktailByIdUseCase getCocktailByIdUseCaseImpl;
  final String cocktailId;

  CocktailBloc(
      {this.cocktailId}):
        getCocktailByIdUseCaseImpl = sl();

  @override
  CocktailState get initialState => CocktailInitialState();

  @override
  Stream<CocktailState> mapEventToState(CocktailEvent event) async* {
    if (event is CocktailScreenLoadedEvent) {
      yield CocktailLoadingState();
      final CocktailDetailsResults data =  await getCocktailByIdUseCaseImpl.execute(
        CocktailDetailsParams(
          categoryId: event.categoryId,
          cocktailId: event.cocktailId,
        ),
      );
      yield CocktailLoadedState(cocktail: data.cocktailDetails,
        similarCocktails: data.similarCocktails,
        cocktailAttributes: SelectedCocktailAttributes(
          selectedAttributes: HashMap<CocktailAttribute, String>(),
        ),
      );
    } else if (event is CocktailSetAttributeEvent) {
      CocktailLoadedState newState = state as CocktailLoadedState;
      yield CocktailLoadingState();
      newState.cocktailAttributes.selectedAttributes[event.attribute] =event.selectedValue;
      yield CocktailLoadedState(cocktail: newState.cocktail,
        similarCocktails: newState.similarCocktails,
        cocktailAttributes: newState.cocktailAttributes,
      );
    }
  }
}