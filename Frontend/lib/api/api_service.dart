import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/model/category.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/product_filter.dart';
import 'package:grocery_app/utils/shared_service.dart';
import 'package:http/http.dart' as http;

import '../model/login_response_model.dart';
import '../model/slider.model.dart';

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
      return categoriesFromJson(data["data"]);
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

    if (productFilterModel.sort_by != null) {
      queryString["sort"] = productFilterModel.sort_by!;
    }
    var url = Uri.http(Config.api_URL, Config.product_api, queryString);
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return productFromJson(data["data"]);
    } else {
      return null;
    }
  }

  static Future<bool> registerUser(
      String full_name, String email, String password) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.api_URL, Config.register_api);

    var respons = await client.post(
      url,
      headers: requestHeader,
      body: jsonEncode(
        {"full_name": full_name, "email": email, "password": password},
      ),
    );
    print(respons.body);
    if (respons.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};

    var url = Uri.http(
      Config.api_URL,
      Config.login_api,
    );
    var respons = await client.post(
      url,
      headers: requestHeader,
      body: jsonEncode({"email": email, "password": password}),
    );

    if (respons.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(respons.body));
      return true;
    } else {
      return false;
    }
  }

  Future<List<SliderModel>?> getSliders(page, pageSize) async {
    Map<String, String> requestHeader = {"Content-Type": "application/json"};
    Map<String, String> queryString = {
      'page': page.toString(),
      'pag_size': pageSize.toString()
    };

    var url = Uri.http(
      Config.api_URL,
      Config.slider_api,
    );

    var response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return slidersFromJson(data["data"]);
    } else {
      return null;
    }
  }
}
