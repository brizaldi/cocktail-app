/*
 * cocktail_app
 * cocktails_event
 * Created by Bahri Rizaldi on 04/06/2020 21:00
 *
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CocktailsListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ScreenLoadedEvent extends CocktailsListEvent {
  ScreenLoadedEvent();

  @override
  List<Object> get props => [];
}

@immutable
class CocktailsChangeViewEvent extends CocktailsListEvent {}