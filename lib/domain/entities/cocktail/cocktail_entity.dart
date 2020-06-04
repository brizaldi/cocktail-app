/*
 * cocktail_app
 * cocktail_entity
 * Created by Bahri Rizaldi on 03/06/2020 21:07
 *
 */

import 'package:cocktailapp/domain/entities/entity.dart';

class CocktailEntity extends Entity<String> {
  final String name;
  final String category;
  final String alcoholic;
  final String glass;
  final String instructions;
  final String thumb;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;
  final String ingredient5;
  final String ingredient6;
  final String ingredient7;
  final String ingredient8;
  final String ingredient9;
  final String ingredient10;
  final String ingredient11;
  final String ingredient12;
  final String ingredient13;
  final String ingredient14;
  final String ingredient15;
  final String measure1;
  final String measure2;
  final String measure3;
  final String measure4;
  final String measure5;
  final String measure6;
  final String measure7;
  final String measure8;
  final String measure9;
  final String measure10;
  final String measure11;
  final String measure12;
  final String measure13;
  final String measure14;
  final String measure15;

  CocktailEntity(
      {String id,
        this.name,
        this.category,
        this.alcoholic,
        this.glass,
        this.instructions,
        this.thumb,
        this.ingredient1,
        this.ingredient2,
        this.ingredient3,
        this.ingredient4,
        this.ingredient5,
        this.ingredient6,
        this.ingredient7,
        this.ingredient8,
        this.ingredient9,
        this.ingredient10,
        this.ingredient11,
        this.ingredient12,
        this.ingredient13,
        this.ingredient14,
        this.ingredient15,
        this.measure1,
        this.measure2,
        this.measure3,
        this.measure4,
        this.measure5,
        this.measure6,
        this.measure7,
        this.measure8,
        this.measure9,
        this.measure10,
        this.measure11,
        this.measure12,
        this.measure13,
        this.measure14,
        this.measure15,
      }) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'idDrink': id,
      'strDrink': name,
    };
  }

  @override
  List<Object> get props => [
    id,
    name,
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
    measure15,
  ];
}