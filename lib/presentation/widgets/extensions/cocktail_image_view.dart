/*
 * cocktail_app
 * cocktail_image_view
 * Created by Bahri Rizaldi on 04/06/2020 6:02
 *
 */

import 'package:cocktailapp/data/model/cocktail_image.dart';
import 'package:flutter/material.dart';

extension View on CocktailImage {
  ImageProvider getView() {
    if (isLocal) {
      return AssetImage(
        address,
      );
    } else {
      return NetworkImage(
        address,
      );
    }
  }
}