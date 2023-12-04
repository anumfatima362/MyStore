import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_store/MVVM/viewModels/classModels/category_detail_model.dart';
import 'package:my_store/MVVM/viewModels/classModels/productModel.dart';
import 'package:my_store/utils/constants/urls.dart';

class ApiServices {
  //Product Category Screen Api    (show list according to category)
  static Future<CategoryDetailModel> fetchCategoryDetail(
      String categoryName) async {
    final url =
        Uri.parse('https://dummyjson.com/products/category/$categoryName');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return CategoryDetailModel.fromJson(data);
      } else {
        throw Exception('Failed to load category detail');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  //Category Screen API
  static Future<List<String>> getCategoryApi(String category) async {
    final respons =
        await http.get(Uri.parse('${ApiUrls.baseUrl}${EndPoints.categories}'));
    var data = jsonDecode(respons.body.toString());
    if (respons.statusCode == 200) {
      return List<String>.from(data);
    } else {
      return List<String>.from(data);
    }
  }

  //Product Screen Api ( This API show All products on screen)
  static Future<ProductModel> getProductApi() async {
    //ham api sa response ka wait kare ga
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
    // ab response ko ham dynamic variable ka andr store kare ga
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  //Search Api
  static Future<ProductModel> getPostApi(String searchQuery) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products/search?q=$searchQuery'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }
}
