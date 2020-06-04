/*
 * cocktail_app
 * cocktail_event
 * Created by Bahri Rizaldi on 04/06/2020 19:12
 *
 */

import 'package:cocktailapp/data/model/cocktail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
class CocktailEvent extends Equatable {

  @override
  List<Object> get props => [];
}

@immutable
class CocktailScreenLoadedEvent extends CocktailEvent {
  final String cocktailId;
  final String categoryId;

  CocktailScreenLoadedEvent({
    @required this.cocktailId,
    @required this.categoryId
  });}

@immutable
class CocktailSetAttributeEvent extends CocktailEvent {
  final String selectedValue;
  final CocktailAttribute attribute;

  CocktailSetAttributeEvent(this.selectedValue, this.attribute);
}