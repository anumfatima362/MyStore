import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_store/MVVM/viewModels/classModels/category_detail_model.dart';
import 'package:my_store/utils/constants/urls.dart';

class ApiServices {
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

  // static Future<ProductDetailModel> fetchProductDetail(String productId) async {
  //   final url = Uri.parse('https://dummyjson.com/products/$productId');
  //   try {
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       return ProductDetailModel.fromJson(data);
  //     } else {
  //       throw Exception('Failed to load category detail');
  //     }
  //   } catch (error) {
  //     throw Exception('Error: $error');
  //   }
  // }
}
