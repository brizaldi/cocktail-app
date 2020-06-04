/*
 * cocktail_app
 * cocktail_category_entity
 * Created by Bahri Rizaldi on 03/06/2020 21:09
 *
 */

import 'package:cocktailapp/domain/entities/entity.dart';

class CocktailCategoryEntity extends Entity<String> {
  final String title;
  final String parentId;

  CocktailCategoryEntity(
      {String id,
        this.title,
        this.parentId,
      }) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'parentId': parentId,
    };
  }

  @override
  List<Object> get props => [
    id,
    title,
    parentId,
  ];
}