/*
 * cocktail_app
 * category_remote_repositories
 * Created by Bahri Rizaldi on 04/06/2020 9:52
 *
 */

import 'package:cocktailapp/data/cocktail_db/models/cocktail_category_model.dart';
import 'package:cocktailapp/data/cocktail_db/repositories/cocktail_db_wrapper.dart';
import 'package:cocktailapp/data/error/exceptions.dart';
import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/data/repositories/abstract/category_repository.dart';
import 'package:flutter/material.dart';

class RemoteCategoryRepository extends CategoryRepository {
  final CocktailDBWrapperAbstract cocktailDB;

  RemoteCategoryRepository({@required this.cocktailDB});

  @override
  Future<List<CocktailCategory>> getCategories({String parentCategoryId = 'c'}) async {
    try {
      var response = await cocktailDB.getCategoryList(parentId: parentCategoryId);
      List<dynamic> categoriesData = response["drinks"];
      List<CocktailCategory> categories = [];
      for (int i = 0; i < categoriesData.length; i++) {
        categories.add(
          CocktailCategory.fromEntity(
            CocktailCategoryModel.fromJson(categoriesData[i], parentCategoryId),
          ),
        );
      }
      return categories;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}