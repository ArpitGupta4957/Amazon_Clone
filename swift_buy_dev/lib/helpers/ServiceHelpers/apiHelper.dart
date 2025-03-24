import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../constants/global_variables.dart';
import '../../providers/user_provider.dart';
import '../ServiceHelpers/appExceptions.dart';
import 'apiResponse.dart';

class ApiHelper {
  late ApiResponse _response;
  Future<dynamic> get(String path,
      {dynamic querryParam, required BuildContext context}) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    // ignore: unused_local_variable
    Map<String, String>? _headers;
    log(user.user.token);
    try {
      Uri uri = Uri.https(baseUrl, "/$path", querryParam);
      final response = await http.get(
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          'x-auth-token': user.user.token
        },
      );
      _response = _returnResponse(response, uri, querryParam);
    } catch (e) {
      rethrow;
    }
    return _response;
  }

  ApiResponse _returnResponse(
      http.Response response, dynamic uri, dynamic querryParam) {
    ApiResponse baseRes =
        ApiResponse.fromJson(json.decode(response.body.toString()));

    switch (response.statusCode) {
      case 200:
        // ignore: unused_local_variable
        dynamic msg = baseRes.message;

        return baseRes;
      case 400:
        // ignore: unused_local_variable
        dynamic msg = baseRes.message;
        return baseRes;
      case 401:
        throw UnauthorisedException(uri.toString() +
            "Url" +
            "$querryParam" +
            "Param" +
            response.body.toString());
      case 403:
        throw UnauthorisedException(uri.toString() +
            "Url" +
            "$querryParam" +
            "Param" +
            response.body.toString());
      case 500:
      //Todo ==> redirect
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<ApiResponse> post(String path, BuildContext context,
      {dynamic querryParam}) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    try {
      Uri uri = Uri.https(baseUrl, "/$path");
      var response =
          await http.post(uri, body: jsonEncode(querryParam), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'x-auth-token': user.user.token
      });
      print(response.body);
      _response = await _returnResponse(response, uri, querryParam);
    } catch (e) {
      rethrow;
    }

    return await _response;
  }
}
