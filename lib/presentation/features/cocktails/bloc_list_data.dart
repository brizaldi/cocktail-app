/*
 * cocktail_app
 * bloc_list_data
 * Created by Bahri Rizaldi on 04/06/2020 21:05
 *
 */

import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/data/model/cocktail.dart';

class CocktailListData {
  final List<Cocktail> cocktails;
  final CocktailCategory category;

  CocktailListData(this.cocktails, this.category);

  CocktailListData copyWith(List<Cocktail> updatedCocktails) {
    return CocktailListData(updatedCocktails, category);
  }
}