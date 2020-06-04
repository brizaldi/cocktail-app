/*
 * cocktail_app
 * find_categories_by_filter_use_case
 * Created by Bahri Rizaldi on 04/06/2020 9:04
 *
 */

import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/data/repositories/abstract/category_repository.dart';
import 'package:cocktailapp/domain/usecases/base_use_case.dart';
import 'package:cocktailapp/locator.dart';

import 'categories_by_filter_params.dart';
import 'categories_by_filter_result.dart';

abstract class FindCategoriesByFilterUseCase
    implements BaseUseCase<CategoriesByFilterResult, CategoriesByFilterParams> {}

class FindCategoriesByFilterUseCaseImpl implements FindCategoriesByFilterUseCase {
  @override
  Future<CategoriesByFilterResult> execute(CategoriesByFilterParams params) async {
    try {
      CategoryRepository _categoryRepository = sl();
      List<CocktailCategory> categories = await _categoryRepository.getCategories(parentCategoryId: params.categoryId);
      return CategoriesByFilterResult(
        categories,
        categories.length,
      );

    } catch (e) {
      return CategoriesByFilterResult(
        null,
        0,
        exception: EmptyCategoriesException(),
      );
    }
  }
}

class EmptyCategoriesException implements Exception {}