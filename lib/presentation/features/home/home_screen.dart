/*
 * cocktail_app
 * home_screen.dart
 * Created by Bahri Rizaldi on 03/06/2020 18:37
 *
 */

import 'file:///C:/Projects/Android/cocktail_app/lib/presentation/widgets/independent/scaffold.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CocktailAppScaffold(
        background: null,
        title: null,
        body: BlocProvider<HomeBloc>(
          create: (context) {
            return HomeBloc(
                cocktailRepository:
                RepositoryProvider.of<CocktailRepository>(context))
              ..add(HomeLoadEvent());
          },
          child: BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, HomeState state) {
                return HomeView(
                  cocktails: state is HomeLoadedState ? state.cocktails : <Cocktail>[],
                );
              }),
        ),
        bottomMenuIndex: 0,
      ),
    );
  }
}