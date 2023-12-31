import 'package:flutter/material.dart';
import 'package:my_store/MVVM/viewModels/classModels/category_detail_model.dart';

class Favorite extends ChangeNotifier {
  final List<Product> _likedProductIds = [];
  List<Product> get likedProductIds => _likedProductIds;



   List<Product> _filteredLikedProducts = [];
   List<Product> get filteredLikedProducts => _filteredLikedProducts ;


  bool isProductLiked(int productId) {
    return _likedProductIds.any((product) => product.id == productId);
  }

  void addToFavorites(Product product) {
    if (!_likedProductIds.contains(product.id)) {
      _likedProductIds.add(product);
      notifyListeners();
    }
  }

  void removeFromFavorites(Product product) {
    _likedProductIds
        .removeWhere((likedProduct) => likedProduct.id == product.id);
    notifyListeners();
  }



 void filterLikedProducts(String query){
  if(query.isEmpty){
    _filteredLikedProducts =_likedProductIds;
  }
  else{
   _filteredLikedProducts = _likedProductIds.where((product) =>
   product.title!.toLowerCase().contains(query.toLowerCase())).toList();
  }
   notifyListeners();
 }

}
