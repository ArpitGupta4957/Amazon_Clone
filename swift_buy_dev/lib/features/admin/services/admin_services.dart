import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/screen/admin_screen.dart';
import 'package:amazon_clone/helpers/ServiceHelpers/apiHelper.dart';
import 'package:amazon_clone/helpers/ServiceHelpers/apiResponse.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../models/product.dart';

class AdminServices {
  ApiHelper helper = ApiHelper();
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    // ignore: unused_local_variable
    final user = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("deuzwzvf9", "wxjb7jo9");
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);
      print(product.toMap());
      ApiResponse response = await helper.post("admin/add-product", context,
          querryParam: product.toMap());
      // http.Response response = await http.post(
      //     Uri.parse('$uri/admin/add-product'),
      //     body: product.toJson(),
      //     headers: <String, String>{
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       'x-auth-token': user.user.token
      //     });
      // httpErrorHandle(
      //     response: response,
      //     context: context,
      //     onSuccess: () {

      //     });
      print(response.message);
      showSnackbar(context, "Product Added Successfully!");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return AdminScreen();
      }), (route) => route.isFirst);
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  getProducts(BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    List<Product> dataList = [];
    try {
      http.Response response = await http
          .get(Uri.parse('$uri/admin/get-products'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': user.user.token
      });
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            for (var json in jsonDecode(response.body)["data"]) {
              Product data = Product.fromMap(json);
              dataList.add(data);
            }
          });
      return dataList;
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  deleteProduct(BuildContext context, String id) async {
    print(id);
    ApiResponse response = await helper.post(
      'admin/delete-product',
      context,
      querryParam: {'id': id},
    );
    if (!response.error) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return AdminScreen();
      }), ((route) => route.isFirst));
      showSnackbar(context, 'Product Deleted Successfully!!');
    }
  }
}
