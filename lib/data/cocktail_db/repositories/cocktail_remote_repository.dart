/*
 * cocktail_app
 * cocktail_remote_repositories
 * Created by Bahri Rizaldi on 04/06/2020 6:46
 *
 */

import 'package:cocktailapp/data/cocktail_db/models/cocktail_model.dart';
import 'package:cocktailapp/data/cocktail_db/repositories/cocktail_db_wrapper.dart';
import 'package:cocktailapp/data/error/exceptions.dart';
import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:flutter/material.dart';

class RemoteCocktailRepository extends CocktailRepository {

  final CocktailDBWrapperAbstract cocktailDB;

  RemoteCocktailRepository({@required this.cocktailDB});

  @override
  Future<List<Cocktail>> filterCocktailByAlcoholic({String filter = "alcoholic"}) async {
    try
    {
      var response = await cocktailDB.filterCocktailByAlcoholic(filter);
      List<dynamic> cocktailsData = response["drinks"];
      List<Cocktail> cocktails = [];

      for(int i = 0; i < cocktailsData.length; i++){
        cocktails.add(
          Cocktail.fromEntity(CocktailModel.fromJson(cocktailsData[i])),
        );
      }
      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<List<Cocktail>> filterCocktailByCategory({String filter = "cocktail"}) async {
    try
    {
      var response = await cocktailDB.filterCocktailByCategory(filter);
      List<dynamic> cocktailsData = response["drinks"];
      List<Cocktail> cocktails = [];

      for(int i = 0; i < cocktailsData.length; i++){
        cocktails.add(
          Cocktail.fromEntity(CocktailModel.fromJson(cocktailsData[i])),
        );
      }
      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<List<Cocktail>> filterCocktailByGlass({String filter = "cocktail_glass"}) async {
    try
    {
      var response = await cocktailDB.filterCocktailByGlass(filter);
      List<dynamic> cocktailsData = response["drinks"];
      List<Cocktail> cocktails = [];

      for(int i = 0; i < cocktailsData.length; i++){
        cocktails.add(
          Cocktail.fromEntity(CocktailModel.fromJson(cocktailsData[i])),
        );
      }
      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<Cocktail> getCocktail({String id}) async {
    try
    {
      var response = await cocktailDB.getCocktailById(id);
      List<dynamic> cocktailsData = response["drinks"];

      return Cocktail.fromEntity(CocktailModel.fromJson(cocktailsData.first));
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<List<Cocktail>> getSimilarCocktails() async {
    try
    {
      var response = await cocktailDB.filterCocktailByCategory("cocktail");
      List<dynamic> cocktailsData = response["drinks"];
      List<Cocktail> cocktails = [];

      for(int i = 0; i < cocktailsData.length; i++){
        cocktails.add(
          Cocktail.fromEntity(CocktailModel.fromJson(cocktailsData[i])),
        );
      }
      return cocktails;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}