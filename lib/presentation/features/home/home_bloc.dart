/*
 * cocktail_app
 * home_bloc
 * Created by Bahri Rizaldi on 04/06/2020 6:16
 *
 */

import 'package:bloc/bloc.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CocktailRepository cocktailRepository;

  HomeBloc({
    @required this.cocktailRepository,
  }) : assert(cocktailRepository != null);

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadEvent) {
      if (state is HomeInitialState) {
        yield HomeLoadedState(
          cocktails: await cocktailRepository.filterCocktailByAlcoholic(),
        );
      } else if (state is HomeLoadedState) {
        yield state;
      }
    }
  }
}
