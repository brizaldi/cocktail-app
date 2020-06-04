/*
 * cocktail_app
 * cocktail_attribute
 * Created by Bahri Rizaldi on 04/06/2020 19:09
 *
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CocktailAttribute extends Equatable {
  final int id;
  final String name;
  final List<String> options;
  final String info;

  const CocktailAttribute(
      {this.id, @required this.name, this.options, this.info});

  @override
  List<Object> get props => [id, name, options, info];
}
