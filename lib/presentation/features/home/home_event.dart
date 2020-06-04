/*
 * cocktail_app
 * home_event
 * Created by Bahri Rizaldi on 04/06/2020 6:18
 *
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class HomeLoadEvent extends HomeEvent {
  @override
  String toString() => 'Home is Loaded';
}
