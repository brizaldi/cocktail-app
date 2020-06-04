/*
 * cocktail_app
 * cocktail_state
 * Created by Bahri Rizaldi on 04/06/2020 19:14
 *
 */

import 'dart:collection';

import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/data/model/cocktail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
class CocktailState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CocktailInitialState extends CocktailState {}

@immutable
class CocktailLoadedState extends CocktailState {
  final Cocktail cocktail;
  final List<Cocktail> similarCocktails;
  final SelectedCocktailAttributes cocktailAttributes;

  CocktailLoadedState(
      {@required this.cocktail,
        @required this.similarCocktails,
        @required this.cocktailAttributes});

  CocktailLoadedState copyWith(
      Cocktail cocktail,
      List<Cocktail> similarCocktails,
      Map<CocktailAttribute, String> cocktailAttributes
      ) {
    return CocktailLoadedState(
      cocktail: cocktail ?? this.cocktail,
      similarCocktails: similarCocktails ?? this.similarCocktails,
      cocktailAttributes: cocktailAttributes ?? this.cocktailAttributes,
    );
  }

  @override
  List<Object> get props => [cocktail, similarCocktails, cocktailAttributes];
}

@immutable
class SelectedCocktailAttributes extends Equatable{
  final HashMap<CocktailAttribute, String> selectedAttributes;

  SelectedCocktailAttributes({
    @required this.selectedAttributes
  });
  @override
  List<Object> get props => [selectedAttributes, selectedAttributes.values];
}

@immutable
class CocktailLoadingState extends CocktailState {}

@immutable
class CocktailErrorState extends CocktailState {}