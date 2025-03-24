import 'package:amazon_clone/helpers/ServiceHelpers/apiHelper.dart';
import 'package:flutter/material.dart';

import '../../../helpers/ServiceHelpers/apiResponse.dart';
import '../../../models/product.dart';

class SearchService {
  ApiHelper helper = ApiHelper();

  Future<List<Product>> getSearchedProduct(
      BuildContext context, String searchQuery) async {
    List<Product> dataList = [];
    ApiResponse response = await helper.get(
      'api/products/search/$searchQuery',
      context: context,
    );
    for (var json in response.data) {
      Product value = Product.fromMap(json);
      dataList.add(value);
    }
    return dataList;
  }
}
