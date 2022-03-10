import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/Screens/Orderscreen.dart';
import 'package:shop_app/Screens/User_productScreen.dart';
import 'package:shop_app/Screens/products_screen.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import '../providers/Products.dart';
import 'package:provider/provider.dart';
import '../Screens/Cartscreen.dart';
import '../providers/orders.dart';


import 'Screens/ProducctDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider (providers: [

    ChangeNotifierProvider(
      create: (ctx)=>Products(),),
        ChangeNotifierProvider(
          create: (ctx)=>Cart(),),
      ChangeNotifierProvider(create: (ctx)=>Orders()),
      ],
      child: MaterialApp(
        title: 'Shopping',
        theme: ThemeData(

          primarySwatch: Colors.purple,
          accentColor: Colors.limeAccent,
          popupMenuTheme: PopupMenuTheme.of(context).copyWith(color:Colors.white70),
        ),

        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName:(ctx)=>ProductDetailScreen(),
          CartScreen.routeName:(ctx)=>CartScreen(),
          OrderScreen.routeName:(ctx)=>OrderScreen(),
          UserProductScreen.routeName:(ctx)=>UserProductScreen(),

        },
      ),
    );
  }
}



