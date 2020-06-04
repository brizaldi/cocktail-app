/*
 * cocktail_app
 * get_cocktail_by_id_use_case
 * Created by Bahri Rizaldi on 04/06/2020 19:20
 *
 */

import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/data/repositories/abstract/cocktail_repository.dart';
import 'package:cocktailapp/domain/usecases/base_use_case.dart';
import 'package:cocktailapp/locator.dart';

abstract class GetCocktailByIdUseCase
    implements BaseUseCase<CocktailDetailsResults, CocktailDetailsParams> {}


class GetCocktailByIdUseCaseImpl implements GetCocktailByIdUseCase {

  @override
  Future<CocktailDetailsResults> execute(CocktailDetailsParams params) async {
    CocktailRepository cocktailRepository = sl();
    Cocktail cocktail = await cocktailRepository.getCocktail(id: params.cocktailId);
    List<Cocktail> cocktails = await cocktailRepository.getSimilarCocktails();
    return CocktailDetailsResults(
      cocktailDetails: cocktail,
      similarCocktails: cocktails,
    );
  }
}

class CocktailDetailsResults{
  final Cocktail cocktailDetails;
  final List<Cocktail> similarCocktails;

  CocktailDetailsResults({this.cocktailDetails, this.similarCocktails});
}

class CocktailDetailsParams{
  final String cocktailId;
  final String categoryId;

  CocktailDetailsParams({this.cocktailId, this.categoryId});
}