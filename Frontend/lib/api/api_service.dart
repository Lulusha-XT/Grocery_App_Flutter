import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/model/category.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/product_filter.dart';
import 'package:http/http.dart' as http;

final apiService = Provider((ref) => ApiService());

class ApiService {
  static var client = http.Client();

  Future<List<Category>?> getCategories(Page, page_size) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': Page.toString(),
      'page_size': page_size.toString()
    };

    var url = Uri.http(Config.api_URL, Config.category_api, queryString);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return categoriesFromJson(data);
    } else {
      return null;
    }
  }

  Future<List<Product>?> getProuduct(
      ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'page_size': productFilterModel.paginationModel.pageSize.toString()
    };

    if (productFilterModel.category_id != null) {
      queryString["category_id"] = productFilterModel.category_id!;
    }
    var url = Uri.http(Config.api_URL, Config.product_api, queryString);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return productFromJson(data);
    } else {
      return null;
    }
  }
}
