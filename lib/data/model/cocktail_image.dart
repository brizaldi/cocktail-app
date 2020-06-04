/*
 * cocktail_app
 * cocktail_image
 * Created by Bahri Rizaldi on 04/06/2020 5:59
 *
 */

class CocktailImage {
  final int id;
  final String address;

  final String altText;
  final bool isLocal;

  CocktailImage(this.id, this.address, this.altText, {this.isLocal = false});

  CocktailImage.placeHolder()
      : this(0, 'assets/placeholder.png', 'no image', isLocal: true);
}
