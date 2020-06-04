/*
 * cocktail_app
 * cocktail_repository
 * Created by Bahri Rizaldi on 04/06/2020 6:21
 *
 */

import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:flutter/material.dart';

abstract class CocktailRepository {
  ///returns product info for the selected [id]
  Future<Cocktail> getCocktail({@required String id});

  Future<List<Cocktail>> getSimilarCocktails();

  Future<List<Cocktail>> filterCocktailByAlcoholic({
    String filter = "alcoholic",
  });

  Future<List<Cocktail>> filterCocktailByCategory({
    String filter = "cocktail",
  });

  Future<List<Cocktail>> filterCocktailByGlass({
    String filter = "cocktail_glass",
  });
}
