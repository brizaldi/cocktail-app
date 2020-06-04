/*
 * cocktail_app
 * home_state
 * Created by Bahri Rizaldi on 04/06/2020 6:19
 *
 */

import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class HomeInitialState extends HomeState {
  @override
  String toString() => 'HomeInitialState';
}

@immutable
class HomeLoadedState extends HomeState {
  final List<Cocktail> cocktails;

  HomeLoadedState({this.cocktails});

  @override
  String toString() => 'HomeLoadedState';

  @override
  List<Object> get props => [cocktails];
}