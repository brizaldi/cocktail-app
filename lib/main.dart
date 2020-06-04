import 'package:cocktailapp/config/routes.dart';
import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:cocktailapp/presentation/features/about/about_screen.dart';
import 'package:cocktailapp/presentation/features/cocktail_details/cocktail_screen.dart';
import 'package:cocktailapp/presentation/features/cocktails/cocktails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/abstract/category_repository.dart';
import 'presentation/features/categories/categories_screen.dart';
import 'presentation/features/home/home_screen.dart';

import 'locator.dart' as service_locator;

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() async {
  service_locator.init();

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CocktailRepository>(
          create: (context) => service_locator.sl(),
        ),
        RepositoryProvider<CategoryRepository>(
          create: (context) => service_locator.sl(),
        ),
      ],
      child: CocktailApp(),
    ),
  );
}

class CocktailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Cocktail App',
      theme: CocktailAppTheme.of(context),
      onGenerateRoute: _registerRoutesWithParameters,
      routes: _registerRoutes(),
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      Routes.home: (context) => HomeScreen(),
    };
  }

  Route _registerRoutesWithParameters(RouteSettings settings) {
    if (settings.name == Routes.categories) {
      final CategoriesParameters args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) {
          return CategoriesScreen(parameters: args);
        },
      );
    } else if (settings.name == Routes.cocktails) {
      final CocktailListScreenParameters parameters = settings.arguments;
      return MaterialPageRoute(builder: (context) {
        return CocktailsScreen(parameters: parameters);
      });
    } else if (settings.name == Routes.cocktailDetail) {
      final CocktailDetailsParameters parameters = settings.arguments;
      return MaterialPageRoute(
        builder: (context) {
          return CocktailDetailsScreen(parameters);
        },
      );
    } else if (settings.name == Routes.about) {
      return MaterialPageRoute(
        builder: (context) {
          return AboutScreen();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      );
    }
  }
}