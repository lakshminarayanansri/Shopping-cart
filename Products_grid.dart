import 'package:flutter/cupertino.dart';
import 'package:shop_app/Widget/product_item.dart';
import 'package:shop_app/providers/Products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget{
  var _showFavoritesOnly;
  ProductsGrid(this._showFavoritesOnly);

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final products=_showFavoritesOnly?productsData.favoriteItems:productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value:products[i],child:ProductItem(//products[i].id,products[i].title,products[i].imageUrl
     )




    ));}
}