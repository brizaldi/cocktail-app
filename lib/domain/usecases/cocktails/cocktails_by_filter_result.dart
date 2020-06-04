/*
 * cocktail_app
 * cocktails_by_filter_result
 * Created by Bahri Rizaldi on 04/06/2020 21:10
 *
 */

import 'package:cocktailapp/data/model/cocktail.dart';

class CocktailsByFilterResult {
  final List<Cocktail> cocktails;
  final int quantity;
  final Exception exception;

  CocktailsByFilterResult(
    this.cocktails,
    this.quantity,
    {
      this.exception
    });

  bool get validResults => exception == null;
}