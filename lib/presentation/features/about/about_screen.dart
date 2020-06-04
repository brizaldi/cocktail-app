/*
 * cocktail_app
 * about_screen
 * Created by Bahri Rizaldi on 04/06/2020 22:12
 *
 */

import 'package:cocktailapp/presentation/features/about/views/about_view.dart';
import 'package:cocktailapp/presentation/widgets/independent/scaffold.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CocktailAppScaffold(
          background: null,
          title: null,
          body: AboutView(),
          bottomMenuIndex: 2,
        ));
  }
}