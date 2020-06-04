/*
 * cocktail_app
 * cocktail_db_wrapper
 * Created by Bahri Rizaldi on 03/06/2020 21:17
 *
 */

import 'dart:convert';

import 'package:cocktailapp/config/api.dart';
import 'package:cocktailapp/data/error/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class CocktailDBWrapperAbstract{
  Future<Map<String, dynamic>> getCocktailById(String cocktailId);
  Future<Map<String, dynamic>> getCategoryList({String parentId = 'c'});
  Future<Map<String, dynamic>> getCocktailListByName(String query);
  Future<Map<String, dynamic>> filterCocktailByCategory(String filter);
  Future<Map<String, dynamic>> filterCocktailByAlcoholic(String filter);
  Future<Map<String, dynamic>> filterCocktailByGlass(String filter);
}

class CocktailDBWrapper implements CocktailDBWrapperAbstract{

  final http.Client client;

  CocktailDBWrapper({@required this.client});

  @override
  Future<Map<String, dynamic>> getCocktailListByName(String query){
    return _getApiRequest(Api.searchByName + query);
  }

  @override
  Future<Map<String, dynamic>> filterCocktailByCategory(String filter){
    return _getApiRequest(Api.filterByCategory + filter);
  }

  @override
  Future<Map<String, dynamic>> filterCocktailByAlcoholic(String filter){
    return _getApiRequest(Api.filterByAlcoholic + filter);
  }

  @override
  Future<Map<String, dynamic>> filterCocktailByGlass(String filter){
    return _getApiRequest(Api.filterByGlass + filter);
  }

  @override
  Future<Map<String, dynamic>> getCategoryList({String parentId = 'c'}){
    return _getApiRequest(Api.listCategory(parentId));
  }

  @override
  Future<Map<String, dynamic>> getCocktailById(String cocktailId) {
    return _getApiRequest(Api.cocktailDetailById + cocktailId);
  }

  Future<Map<String, dynamic>> _getApiRequest(String url) async {
    print(url);
    final response = await client.get(url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw HttpRequestException();
    }
  }
}