/*
 * cocktail_app
 * find_cocktails_by_filter_use_case
 * Created by Bahri Rizaldi on 04/06/2020 21:09
 *
 */

import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:cocktailapp/domain/usecases/base_use_case.dart';
import 'package:cocktailapp/locator.dart';

import 'cocktails_by_filter_params.dart';
import 'cocktails_by_filter_result.dart';

abstract class FindCocktailsByFilterUseCase
    implements BaseUseCase<CocktailsByFilterResult, CocktailsByFilterParams> {}


class FindCocktailsByFilterUseCaseImpl implements FindCocktailsByFilterUseCase {

  @override
  Future<CocktailsByFilterResult> execute(CocktailsByFilterParams params) async {
    try {
      var cocktails = await _findCocktailsByFilter(params);

      if (cocktails != null && cocktails.isNotEmpty) {
        return CocktailsByFilterResult(
          cocktails,
          cocktails.length,
        );
      }

    } catch (e) {
      return CocktailsByFilterResult(
        [],
        0,
        exception: EmptyProductsException(),
      );
    }
    return CocktailsByFilterResult(
      [],
      0,
      exception: EmptyProductsException(),
    );
  }

  Future<List<Cocktail>> _findCocktailsByFilter(CocktailsByFilterParams params) async {
    List<Cocktail> cocktails;
    if (params.filterByCategory) {
      CocktailRepository cocktailRepository = sl();
      cocktails = await cocktailRepository.filterCocktailByCategory(filter: params.categoryId);
    }
    return cocktails;
  }
}

class EmptyProductsException implements Exception {}