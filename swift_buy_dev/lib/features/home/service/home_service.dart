import 'package:amazon_clone/helpers/ServiceHelpers/apiHelper.dart';
import 'package:amazon_clone/helpers/ServiceHelpers/apiResponse.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/cupertino.dart';

import '../../../helpers/api_constants.dart';

class HomeService {
  ApiHelper helper = ApiHelper();

  Future<List<Product>> getCategoryProduct(
      BuildContext context, String category) async {
    List<Product> dataList = [];
    ApiResponse response = await helper.get('api/products',
        context: context, querryParam: {"category": category});
    for (var json in response.data) {
      Product value = Product.fromMap(json);
      dataList.add(value);
    }
    return dataList;
  }
}
