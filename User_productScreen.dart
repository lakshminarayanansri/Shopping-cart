import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Widget/App_drawer.dart';
import 'package:shop_app/Widget/User_Product_item.dart';
import 'package:shop_app/providers/Products.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = 'user-products';

  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                  productsData.items[i].title, productsData.items[i].imageUrl),
              Divider()
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
