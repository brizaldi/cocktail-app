/*
 * cocktail_app
 * entity.dart
 * Created by Bahri Rizaldi on 03/06/2020 21:06
 *
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class Entity<TKey> extends Equatable {
  final TKey id;

  Entity(this.id);

  Map<String, dynamic> toMap() {
    return {
      'id': id
    };
  }

  @override
  List<Object> get props => [];
}
