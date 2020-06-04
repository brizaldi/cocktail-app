/*
 * cocktail_app
 * cocktail_category_model
 * Created by Bahri Rizaldi on 04/06/2020 10:01
 *
 */

import 'package:cocktailapp/domain/entities/cocktail/cocktail_category_entity.dart';
import 'package:flutter/material.dart';

class CocktailCategoryModel extends CocktailCategoryEntity {

  CocktailCategoryModel(
      {@required String id,
        @required String title,
        @required String parentId}) : super(
      id: id,
      title: title,
      parentId: parentId
  );

  factory CocktailCategoryModel.fromJson(Map<String, dynamic> json, String parentId) {
    var entryList = json.entries.toList();

    if(entryList.isEmpty)
      return CocktailCategoryModel(id: "", title: "", parentId: parentId);

    return CocktailCategoryModel(
      id: entryList.first.value.replaceAll(' ', '_'),
      title: entryList.first.value,
      parentId: parentId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'parent': parentId,
    };
  }
}