/*
 * cocktail_app
 * category_repository
 * Created by Bahri Rizaldi on 04/06/2020 9:09
 *
 */

import 'package:cocktailapp/data/model/category.dart';

abstract class CategoryRepository {
  ///returns categories list for the selected parent category.
  Future<List<CocktailCategory>> getCategories({String parentCategoryId = 'c'});
}