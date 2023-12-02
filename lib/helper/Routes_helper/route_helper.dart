import 'package:flutter/material.dart';
import 'package:my_store/MVVM/views/CategoriesScreen/categories.dart';
import 'package:my_store/MVVM/views/FavoriteScreen/favorite.dart';
import 'package:my_store/MVVM/views/Product_Screen/product_screen.dart';
import 'package:my_store/MVVM/views/Product_details/product_details.dart';
import 'package:my_store/MVVM/views/Product_list_Screen/item_list.dart';
import 'package:my_store/MVVM/views/splashscreen/splash_screen.dart';

class RouterHelper {
  static const initial = "/";
  static const productscreen = "/productScreen";
  static const categoriesScreen = "/categoriesScreen";
  static const favoriteScreen = "/favoriteScreen";
  static const profileScreen = "/profileScreen";
  static const itemlist = "/itemlist";
  static const product_details = "/productDetail";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    productscreen: (context) => const ProductScreen(),
    categoriesScreen: (context) => const CategoriesScreen(),
    favoriteScreen: (context) => const FavoriteScreen(),
    itemlist: (context) => const ItemList(),
    product_details: (context) => const ProductDetails(),
  };
}
