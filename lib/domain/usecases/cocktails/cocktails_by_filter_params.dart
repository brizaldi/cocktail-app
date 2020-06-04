/*
 * cocktail_app
 * cocktails_by_filter_params
 * Created by Bahri Rizaldi on 04/06/2020 21:12
 *
 */

class CocktailsByFilterParams {
  final String categoryId;

  CocktailsByFilterParams({
    this.categoryId,
  });

  bool get filterByCategory => categoryId != null;
}