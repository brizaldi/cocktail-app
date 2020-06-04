/*
 * cocktail_app
 * categories_bloc
 * Created by Bahri Rizaldi on 04/06/2020 8:56
 *
 */

import 'package:bloc/bloc.dart';
import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/domain/usecases/categories/categories_by_filter_params.dart';
import 'package:cocktailapp/domain/usecases/categories/find_categories_by_filter_use_case.dart';
import 'package:cocktailapp/locator.dart';
import 'categories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final FindCategoriesByFilterUseCase findCategoriesByFilterUseCase;

  CategoryBloc(): findCategoriesByFilterUseCase = sl();

  @override
  CategoryState get initialState => CategoryLoadingState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryShowListEvent) {
      if (state is CategoryListViewState) {
        if (state.parentCategoryId != event.parentCategoryId) {
          yield CategoryLoadingState();
          List<CocktailCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
          yield CategoryListViewState(
            categories: categories, parentCategoryId: event.parentCategoryId,
          );
        }
      } else {
        yield CategoryLoadingState();
        List<CocktailCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
        yield CategoryListViewState(
          parentCategoryId: event.parentCategoryId, categories: categories,
        );
      }
    } else if (event is ChangeCategoryParent) {
      yield CategoryLoadingState();
      List<CocktailCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
      if (state is CategoryListViewState) {
        yield CategoryListViewState(
          parentCategoryId: event.parentCategoryId, categories: categories,
        );
      } else {
        yield CategoryListViewState(
          parentCategoryId: event.parentCategoryId, categories: categories,
        );
      }
    }
  }
  Future<List<CocktailCategory>> _getCategoriesByFilter(String categoryId) async{
    final categoriesData = await findCategoriesByFilterUseCase.execute(
      CategoriesByFilterParams(
        categoryId: categoryId,
      ),
    );
    return categoriesData.categories;
  }
}