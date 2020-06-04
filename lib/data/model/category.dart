/*
 * cocktail_app
 * category.dart
 * Created by Bahri Rizaldi on 03/06/2020 21:41
 *
 */

import 'package:cocktailapp/data/error/exceptions.dart';
import 'package:cocktailapp/domain/entities/cocktail/cocktail_category_entity.dart';
import 'package:cocktailapp/domain/entities/entity.dart';
import 'package:equatable/equatable.dart';

class CocktailCategory extends Equatable {
  final String id;
  final String parentId;
  final String name;

  CocktailCategory(
      this.id, {
        String parentId,
        this.name,
      })  : parentId = parentId ?? 'c';

  @override
  List<Object> get props => [id, parentId, name];

  @override
  bool get stringify => true;

  @override
  factory CocktailCategory.fromEntity(Entity entity) {
    if ( entity is CocktailCategoryEntity ) {
      return CocktailCategory(
        entity.id,
        parentId: entity.parentId,
        name: entity.title,
      );
    } else {
      throw EntityModelMapperException(message: 'Entity should be of type CocktailCategoryEntity');
    }
  }
}