/*
 * cocktail_app
 * api.dart
 * Created by Bahri Rizaldi on 03/06/2020 18:07
 *
 */

class Api {
  static const _apiKey = '1';
  static const baseUrl = 'https://www.thecocktaildb.com/api/json/v1/$_apiKey/';

  static const _searchByNameSuffix = 'search.php?s=';
  static const _searchIngredientByName = 'search.php?f=';
  static const _searchByIngredient = 'filter.php?i=';
  static const _cocktailDetailById = 'lookup.php?i=';
  static const _ingredientById = 'lookup.php?iid=';
  static const _randomCocktail = 'random.php';
  static const _filterByAlcoholic = 'filter.php?a=';
  static const _filterByCategory = 'filter.php?c=';
  static const _filterByGlass = 'filter.php?g=';
  static const _listTheCategory = 'list.php?';

  static String get searchByName => baseUrl + _searchByNameSuffix;
  static String get searchIngredientByName => baseUrl + _searchIngredientByName;
  static String get searchByIngredient => baseUrl + _searchByIngredient;
  static String get cocktailDetailById => baseUrl + _cocktailDetailById;
  static String get ingredientById => baseUrl + _ingredientById;
  static String get randomCocktail => baseUrl + _randomCocktail;
  static String get filterByAlcoholic => baseUrl + _filterByAlcoholic;
  static String get filterByCategory => baseUrl + _filterByCategory;
  static String get filterByGlass => baseUrl + _filterByGlass;

  static String listCategory(String parentId) => baseUrl + _listTheCategory + parentId + '=list';
}