/*
 * cocktail_app
 * categories_state
 * Created by Bahri Rizaldi on 04/06/2020 8:57
 *
 */

import 'package:cocktailapp/data/model/category.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CategoryState extends Equatable {
  final String parentCategoryId;

  CategoryState({this.parentCategoryId = 'c'});

  @override
  List<Object> get props => [parentCategoryId];
}

@immutable
class CategoryLoadingState extends CategoryState {
  @override
  String toString() => 'CategoryInitialState';
}

@immutable
abstract class CategoryViewState extends CategoryState {
  final List<CocktailCategory> categories;

  CategoryViewState({String parentCategoryId, this.categories})
      : super(parentCategoryId: parentCategoryId);

  @override
  List<Object> get props => [categories, parentCategoryId];
}

@immutable
class CategoryListViewState extends CategoryViewState {
  CategoryListViewState({String parentCategoryId, List<CocktailCategory> categories})
      : super(parentCategoryId: parentCategoryId, categories: categories);

  @override
  String toString() => 'CategoryListViewState';
}

@immutable
class CategoryErrorState extends CategoryState {
  @override
  String toString() => 'CategoryErrorState';
}