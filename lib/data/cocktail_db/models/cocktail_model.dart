/*
 * cocktail_app
 * cocktail_model
 * Created by Bahri Rizaldi on 04/06/2020 6:49
 *
 */

import 'package:cocktailapp/domain/entities/cocktail/cocktail_entity.dart';
import 'package:flutter/material.dart';

class CocktailModel extends CocktailEntity {

  CocktailModel(
      {@required String id,
        @required name,
        category,
        alcoholic,
        glass,
        instructions,
        thumb,
        ingredient1,
        ingredient2,
        ingredient3,
        ingredient4,
        ingredient5,
        ingredient6,
        ingredient7,
        ingredient8,
        ingredient9,
        ingredient10,
        ingredient11,
        ingredient12,
        ingredient13,
        ingredient14,
        ingredient15,
        measure1,
        measure2,
        measure3,
        measure4,
        measure5,
        measure6,
        measure7,
        measure8,
        measure9,
        measure10,
        measure11,
        measure12,
        measure13,
        measure14,
        measure15,}) : super(
    id: id,
    name: name,
    category: category,
    alcoholic: alcoholic,
    glass: glass,
    instructions: instructions,
    thumb: thumb,
    ingredient1: ingredient1,
    ingredient2: ingredient2,
    ingredient3: ingredient3,
    ingredient4: ingredient4,
    ingredient5: ingredient5,
    ingredient6: ingredient6,
    ingredient7: ingredient7,
    ingredient8: ingredient8,
    ingredient9: ingredient9,
    ingredient10: ingredient10,
    ingredient11: ingredient11,
    ingredient12: ingredient12,
    ingredient13: ingredient13,
    ingredient14: ingredient14,
    ingredient15: ingredient15,
    measure1: measure1,
    measure2: measure2,
    measure3: measure3,
    measure4: measure4,
    measure5: measure5,
    measure6: measure6,
    measure7: measure7,
    measure8: measure8,
    measure9: measure9,
    measure10: measure10,
    measure11: measure11,
    measure12: measure12,
    measure13: measure13,
    measure14: measure14,
    measure15: measure15,
  );

  factory CocktailModel.fromJson(Map<String, dynamic> json) {
    return CocktailModel(
      id: json['idDrink'],
      name: json['strDrink'],
      category: json['strCategory'],
      alcoholic: json['strAlcoholic'],
      glass: json['strGlass'],
      instructions: json['strInstructions'],
      thumb: json['strDrinkThumb'],
      ingredient1: json['strIngredient1'],
      ingredient2: json['strIngredient2'],
      ingredient3: json['strIngredient3'],
      ingredient4: json['strIngredient4'],
      ingredient5: json['strIngredient5'],
      ingredient6: json['strIngredient6'],
      ingredient7: json['strIngredient7'],
      ingredient8: json['strIngredient8'],
      ingredient9: json['strIngredient9'],
      ingredient10: json['strIngredient10'],
      ingredient11: json['strIngredient11'],
      ingredient12: json['strIngredient12'],
      ingredient13: json['strIngredient13'],
      ingredient14: json['strIngredient14'],
      ingredient15: json['strIngredient15'],
      measure1: json['strMeasure1'],
      measure2: json['strMeasure2'],
      measure3: json['strMeasure3'],
      measure4: json['strMeasure4'],
      measure5: json['strMeasure5'],
      measure6: json['strMeasure6'],
      measure7: json['strMeasure7'],
      measure8: json['strMeasure8'],
      measure9: json['strMeasure9'],
      measure10: json['strMeasure10'],
      measure11: json['strMeasure11'],
      measure12: json['strMeasure12'],
      measure13: json['strMeasure13'],
      measure14: json['strMeasure14'],
      measure15: json['strMeasure15'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idDrink': id,
      'strDrink': name,
    };
  }
}