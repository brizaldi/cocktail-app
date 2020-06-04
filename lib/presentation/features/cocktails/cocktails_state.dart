/*
 * cocktail_app
 * cocktails_state
 * Created by Bahri Rizaldi on 04/06/2020 21:00
 *
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'bloc_list_data.dart';

abstract class CocktailsState extends Equatable {
  final CocktailListData data;
  final String error;

  CocktailsState({
    this.data,
    this.error,
  });

  CocktailsState copyWith({
    CocktailListData data,
    String error,
  });

  CocktailsState getLoading() {
    return copyWith(data: null);
  }

  bool get isProductsLoading => data == null;
  bool get hasError => error != null;

  @override
  List<Object> get props => [data];

  @override
  bool get stringify => true;
}

@immutable
class CocktailsListViewState extends CocktailsState {
  CocktailsListViewState({
    CocktailListData data,
    String error,
  }) : super(
      data: data, error: error,
  );

  CocktailsTileViewState getTiles() {
    return CocktailsTileViewState(data: data);
  }

  @override
  CocktailsListViewState copyWith({
    CocktailListData data,
    String error,
  }) {
    return CocktailsListViewState(
      data: data ?? this.data,
      error: error,
    );
  }
}

@immutable
class CocktailsTileViewState extends CocktailsState {
  CocktailsTileViewState(
      {
        CocktailListData data,
        String error})
      : super(
      data: data, error: error);

  @override
  CocktailsTileViewState copyWith({
    CocktailListData data,
    String error,
  }) {
    return CocktailsTileViewState(
      data: data ?? this.data,
      error: error,
    );
  }

  CocktailsListViewState getList() {
    return CocktailsListViewState(data: data);
  }
}