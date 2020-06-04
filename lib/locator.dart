/*
 * cocktail_app
 * locator
 * Created by Bahri Rizaldi on 04/06/2020 6:39
 *
 */

import 'package:cocktailapp/data/cocktail_db/repositories/cocktail_db_wrapper.dart';
import 'package:cocktailapp/data/network/network_status.dart';
import 'package:cocktailapp/data/repositories/abstract/category_repository.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:cocktailapp/data/repositories/category_repository_impl.dart';
import 'package:cocktailapp/data/repositories/cocktail_repository_impl.dart';
import 'package:cocktailapp/domain/usecases/categories/find_categories_by_filter_use_case.dart';
import 'package:cocktailapp/domain/usecases/cocktails/get_cocktail_by_id_use_case.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

import 'domain/usecases/cocktails/find_cocktails_by_filter_use_case.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(DataConnectionChecker()));

  //get categories list by filter use case
  sl.registerLazySingleton<FindCategoriesByFilterUseCase>(() => FindCategoriesByFilterUseCaseImpl());

  //get product list by filter use case
  sl.registerLazySingleton<FindCocktailsByFilterUseCase>(() => FindCocktailsByFilterUseCaseImpl());

  //get product details by id use case
  sl.registerLazySingleton<GetCocktailByIdUseCase>(() => GetCocktailByIdUseCaseImpl());

  //Singleton for HTTP request
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<CocktailDBWrapperAbstract>(
        () => CocktailDBWrapper(client: sl()),
  );

  sl.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(),
  );

  sl.registerLazySingleton<CocktailRepository>(
        () => CocktailRepositoryImpl(),
  );
}