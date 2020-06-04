/*
 * cocktail_app
 * category_repository_impl
 * Created by Bahri Rizaldi on 04/06/2020 10:14
 *
 */

import 'package:cocktailapp/data/cocktail_db/repositories/category_remote_repositories.dart';
import 'package:cocktailapp/data/error/exceptions.dart';
import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/data/network/network_status.dart';
import 'package:cocktailapp/data/repositories/abstract/category_repository.dart';
import 'package:cocktailapp/locator.dart';

//Uses remote or local data depending on NetworkStatus
class CategoryRepositoryImpl extends CategoryRepository {

  @override
  Future<List<CocktailCategory>> getCategories({String parentCategoryId = 'c'}) async {
    try {
      NetworkStatus networkStatus = sl();
      CategoryRepository categoryRepository;
      if (networkStatus.isConnected != null) {
        categoryRepository =
            RemoteCategoryRepository(cocktailDB: sl());
      } else {
        //TODO get data from local
      }

      return await categoryRepository.getCategories(
          parentCategoryId: parentCategoryId);
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}