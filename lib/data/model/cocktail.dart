/*
 * cocktail_app
 * cocktail.dart
 * Created by Bahri Rizaldi on 03/06/2020 20:58
 *
 */

import 'package:cocktailapp/data/error/exceptions.dart';
import 'package:cocktailapp/data/model/cocktail_image.dart';
import 'package:cocktailapp/domain/entities/cocktail/cocktail_entity.dart';
import 'package:cocktailapp/domain/entities/entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Cocktail extends Equatable {
  final String id;
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

  Cocktail(
      this.id, {
        @required this.name,
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
      });

  //Method mapping domain entity with presentation level model
  @override
  factory Cocktail.fromEntity(Entity entity) {
    if ( entity is CocktailEntity ) {
      return Cocktail(
        entity.id,
        name: entity.name,
        category: entity.category,
        alcoholic: entity.alcoholic,
        glass: entity.glass,
        instructions: entity.instructions,
        thumb: entity.thumb,
        ingredient1: entity.ingredient1,
        ingredient2: entity.ingredient2,
        ingredient3: entity.ingredient3,
        ingredient4: entity.ingredient4,
        ingredient5: entity.ingredient5,
        ingredient6: entity.ingredient6,
        ingredient7: entity.ingredient7,
        ingredient8: entity.ingredient8,
        ingredient9: entity.ingredient9,
        ingredient10: entity.ingredient10,
        ingredient11: entity.ingredient11,
        ingredient12: entity.ingredient12,
        ingredient13: entity.ingredient13,
        ingredient14: entity.ingredient14,
        ingredient15: entity.ingredient15,
        measure1: entity.measure1,
        measure2: entity.measure2,
        measure3: entity.measure3,
        measure4: entity.measure4,
        measure5: entity.measure5,
        measure6: entity.measure6,
        measure7: entity.measure7,
        measure8: entity.measure8,
        measure9: entity.measure9,
        measure10: entity.measure10,
        measure11: entity.measure11,
        measure12: entity.measure12,
        measure13: entity.measure13,
        measure14: entity.measure14,
        measure15: entity.measure15,
      );
    } else {
      throw EntityModelMapperException(message: 'Entity should be of type CocktailEntity');
    }
  }

  @override
  List<Object> get props => [
    id,
    name,
  ];

  @override
  bool get stringify => true;

  CocktailImage get mainImage => (thumb != null)
      ? CocktailImage(0, thumb, '')
      : CocktailImage.placeHolder();
}