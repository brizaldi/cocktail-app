/*
 * cocktail_app
 * cocktail_repository_impl
 * Created by Bahri Rizaldi on 04/06/2020 6:33
 *
 */

//Uses remote or local data depending on NetworkStatus
import 'package:cocktailapp/data/cocktail_db/repositories/cocktail_remote_repository.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:cocktailapp/data/error/exceptions.dart';
import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/data/network/network_status.dart';
import 'package:cocktailapp/locator.dart';

class CocktailRepositoryImpl extends CocktailRepository {

  static CocktailDataStorage dataStorage = CocktailDataStorage();

  @override
  Future<List<Cocktail>> filterCocktailByAlcoholic({String filter = "alcoholic"}) async {
    try
    {
      NetworkStatus networkStatus = sl();
      CocktailRepository cocktailRepository;
      if ( networkStatus.isConnected != null ) {
        cocktailRepository = RemoteCocktailRepository(cocktailDB: sl());
      } else {
        //TODO get data from local
      }

      List<Cocktail> cocktails = await cocktailRepository.filterCocktailByAlcoholic(filter: filter);

      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<List<Cocktail>> filterCocktailByCategory({String filter = "cocktail"}) async {
    try
    {
      NetworkStatus networkStatus = sl();
      CocktailRepository cocktailRepository;
      if ( networkStatus.isConnected != null ) {
        cocktailRepository = RemoteCocktailRepository(cocktailDB: sl());
      } else {
        //TODO get data from local
      }

      List<Cocktail> cocktails = await cocktailRepository.filterCocktailByCategory(filter: filter);

      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<List<Cocktail>> filterCocktailByGlass({String filter = "cocktail_glass"}) async {
    try
    {
      NetworkStatus networkStatus = sl();
      CocktailRepository cocktailRepository;
      if ( networkStatus.isConnected != null ) {
        cocktailRepository = RemoteCocktailRepository(cocktailDB: sl());
      } else {
        //TODO get data from local
      }

      List<Cocktail> cocktails = await cocktailRepository.filterCocktailByGlass(filter: filter);

      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<List<Cocktail>> getSimilarCocktails() async {
    try
    {
      NetworkStatus networkStatus = sl();
      CocktailRepository cocktailRepository;
      if ( networkStatus.isConnected != null ) {
        cocktailRepository = RemoteCocktailRepository(cocktailDB: sl());
      } else {
        //TODO get data from local
      }

      List<Cocktail> cocktails = await cocktailRepository.getSimilarCocktails();

      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<Cocktail> getCocktail({String id}) async {
    try
    {
      NetworkStatus networkStatus = sl();
      CocktailRepository cocktailRepository;
      if ( networkStatus.isConnected != null ) {
        cocktailRepository = RemoteCocktailRepository(cocktailDB: sl());
      } else {
        //TODO get data from local
      }

      Cocktail cocktail = await cocktailRepository.getCocktail(id: id);

      return cocktail;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}

class CocktailDataStorage {
  List<Cocktail> cocktails = [];
}