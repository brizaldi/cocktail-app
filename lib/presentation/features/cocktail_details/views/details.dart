/*
 * cocktail_app
 * details
 * Created by Bahri Rizaldi on 04/06/2020 19:38
 *
 */

import 'package:cocktailapp/config/theme.dart';
import 'package:cocktailapp/data/model/category.dart';
import 'package:cocktailapp/data/model/cocktail.dart';
import 'package:cocktailapp/presentation/widgets/data_driven/cocktail_list_view.dart';
import 'package:cocktailapp/presentation/widgets/independent/expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cocktail.dart';

class CocktailDetailsView extends StatefulWidget {
  final Cocktail cocktail;
  final Function changeView;
  final CocktailCategory category;

  final List<Cocktail> similarCocktails;

  const CocktailDetailsView(
      {Key key,
        @required this.cocktail,
        @required this.changeView,
        @required this.similarCocktails,
        this.category})
      : assert(cocktail!=null),
        super(key: key);

  @override
  _CocktailDetailsViewState createState() => _CocktailDetailsViewState();
}

class _CocktailDetailsViewState extends State<CocktailDetailsView> {
  Orientation orientation;
  CocktailBloc bloc;

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final dividerTheme = Theme.of(context).copyWith(dividerColor: AppColors.darkGray);
    ScreenUtil.init(context);
    var deviceWidth = ScreenUtil.screenWidth;
    var deviceHeight = ScreenUtil.screenHeight;
    bloc = BlocProvider.of<CocktailBloc>(context);
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is CocktailErrorState) {
          return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
              style: _theme.textTheme.display1.copyWith(color: _theme.errorColor),
            ),
          );
        }
        return Container();
      },
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, CocktailState state) {
            if (state is CocktailLoadedState) {
              return SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            height: deviceHeight * 0.52,
                            child: Image.network(
                              state.cocktail.thumb,
                            ),
                          ),
                          cocktailDetails(_theme),
                          Theme(data: dividerTheme, child: Divider()),
                          CocktailAppExpansionTile(
                            title: 'Ingredients',
                            content: ingredientsContent(_theme),
                          ),
                          Theme(data: dividerTheme, child: Divider()),
                          CocktailAppExpansionTile(
                            title: 'Instructions',
                            content: Text(
                              widget.cocktail.instructions ?? "No instructions :(",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          Theme(data: dividerTheme, child: Divider()),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'You may also like this',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.similarCocktails.length.toString() + ' items',
                                  style: TextStyle(color: AppColors.lightGray),
                                ),
                              ],
                            ),
                          ),
                          CocktailAppCocktailListView(
                            width: deviceWidth,
                            cocktails: widget.similarCocktails,
                            size: CocktailListSize.small,
                          )
                        ],
                      ),
                    ),
                  ),
              );
            }
            return Container();
          },
        ),
    );
  }

  Widget cocktailDetails(ThemeData theme) {
    //title,rating,price of product
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.cocktail.name,
            style: theme.textTheme.title,
          ),
          widget.category == null ? Container() : Text(
            widget.category.name,
            style: theme.textTheme.body1,
          ),
        ],
      ),
    );
  }

  Widget ingredientsContent(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ingredientsText(
          measure: widget.cocktail.measure1,
          ingredient: widget.cocktail.ingredient1,
        ),
        ingredientsText(
          measure: widget.cocktail.measure2,
          ingredient: widget.cocktail.ingredient2,
        ),
        ingredientsText(
          measure: widget.cocktail.measure3,
          ingredient: widget.cocktail.ingredient3,
        ),
        ingredientsText(
          measure: widget.cocktail.measure4,
          ingredient: widget.cocktail.ingredient4,
        ),
        ingredientsText(
          measure: widget.cocktail.measure5,
          ingredient: widget.cocktail.ingredient5,
        ),
        ingredientsText(
          measure: widget.cocktail.measure6,
          ingredient: widget.cocktail.ingredient6,
        ),
        ingredientsText(
          measure: widget.cocktail.measure7,
          ingredient: widget.cocktail.ingredient7,
        ),
        ingredientsText(
          measure: widget.cocktail.measure8,
          ingredient: widget.cocktail.ingredient8,
        ),
        ingredientsText(
          measure: widget.cocktail.measure9,
          ingredient: widget.cocktail.ingredient9,
        ),
        ingredientsText(
          measure: widget.cocktail.measure10,
          ingredient: widget.cocktail.ingredient10,
        ),
        ingredientsText(
          measure: widget.cocktail.measure11,
          ingredient: widget.cocktail.ingredient11,
        ),
        ingredientsText(
          measure: widget.cocktail.measure12,
          ingredient: widget.cocktail.ingredient12,
        ),
        ingredientsText(
          measure: widget.cocktail.measure13,
          ingredient: widget.cocktail.ingredient13,
        ),
        ingredientsText(
          measure: widget.cocktail.measure14,
          ingredient: widget.cocktail.ingredient14,
        ),
        ingredientsText(
          measure: widget.cocktail.measure15,
          ingredient: widget.cocktail.ingredient15,
        ),
      ],
    );
  }

  Widget ingredientsText({String measure, String ingredient}) {
    return ingredient != null ? RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 15.0, color: AppColors.lightGray),
        children: <TextSpan>[
          TextSpan(
            text: "• ",
            style: TextStyle(fontSize: 15.0, color: AppColors.lightGray),
          ),
          TextSpan(
            text: measure != null ? "$measure " : "",
            style: TextStyle(fontSize: 15.0, color: AppColors.lightGray),
          ),
          TextSpan(
            text: ingredient ?? "",
            style: TextStyle(fontSize: 15.0, color: AppColors.lightGray),
          ),
        ],
      ),
    ) : Container();
  }
}