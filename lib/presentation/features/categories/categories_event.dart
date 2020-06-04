/*
 * cocktail_app
 * categories_event
 * Created by Bahri Rizaldi on 04/06/2020 8:59
 *
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  final String parentCategoryId;
  CategoryEvent(this.parentCategoryId) : super();

  @override
  List<Object> get props => [parentCategoryId];
}

@immutable
class CategoryShowListEvent extends CategoryEvent {
  CategoryShowListEvent(String parentCategoryId) : super(parentCategoryId);
}

class ChangeCategoryParent extends CategoryEvent {
  ChangeCategoryParent(String parentCategoryId) : super(parentCategoryId);
}