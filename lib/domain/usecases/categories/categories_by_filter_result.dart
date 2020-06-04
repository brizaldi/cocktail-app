/*
 * cocktail_app
 * categories_by_filter_result
 * Created by Bahri Rizaldi on 04/06/2020 9:06
 *
 */

import 'package:cocktailapp/data/model/category.dart';

class CategoriesByFilterResult {
  final List<CocktailCategory> categories;
  final int quantity;
  final Exception exception;

  CategoriesByFilterResult(
    this.categories,
    this.quantity,{
      this.exception,
    });

  bool get validResults => exception == null;
}