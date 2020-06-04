/*
 * cocktail_app
 * exceptions
 * Created by Bahri Rizaldi on 03/06/2020 21:20
 *
 */

//Exception that is thrown when http request call response is not 200
import 'package:flutter/material.dart';

class HttpRequestException implements Exception {}

//Exception that is thrown when value is not presented in Local Db
class LocalDbExceptionImplements implements Exception {}

//Exception that is thrown when Entity to Model conversion is performed
class EntityModelMapperException implements Exception {
  final String message;

  EntityModelMapperException({@required this.message});
}

class RemoteServerException implements Exception {}

class LocalDatabaseException implements Exception {}