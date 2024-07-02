import 'dart:convert';

import 'package:suffa_skipass/data/network/api_end_points.dart';
import 'package:suffa_skipass/models/remote/products/myproducts.dart';
import 'package:suffa_skipass/models/remote/products/products.dart';
import 'package:suffa_skipass/repository/api_auth/api_auth_repo_impl.dart';
import 'package:suffa_skipass/repository/products/buyproduct/buyproduct_repo.dart';

import '../../../data/network/base_api_service.dart';
import '../../../data/network/network_api_service.dart';

class BuyProductRepoImpl extends BuyProductRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<List<ProductModel>?> getProducts() async {
    try {
      bool auth = await ApiAuthRepoImpl().login();

      if (auth) {
        dynamic response =
            await _apiService.getResponse("${ApiEndpoints.getProducts}1");

        if (response is bool) return null;

        List<dynamic> jsonList = json.decode(response);

        return jsonList
            .map((jsonItem) => ProductModel.fromJson(jsonItem))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> buyProduct(int productId) async {
    try {
      bool auth = await ApiAuthRepoImpl().login();

      if (auth) {
        String requestUrl = "${ApiEndpoints.payment}pID=$productId&uID=2";
        dynamic response = await _apiService.getResponse(requestUrl);

        return response == "true";
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<MyProductsModel>?> getMyProducts() async {
    try {
      bool auth = await ApiAuthRepoImpl().login();

      if (auth) {
        dynamic response =
            await _apiService.getResponse(ApiEndpoints.myProducts);

        if (response is bool) return null;

        List<dynamic> jsonList = json.decode(response);

        return jsonList
            .map((jsonItem) => MyProductsModel.fromJson(jsonItem))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> createQrCode(String code) async {
    try {
      bool auth = await ApiAuthRepoImpl().login();

      if (auth) {
        String requestUrl = "${ApiEndpoints.createQr}$code";
        dynamic response = await _apiService.getResponse(requestUrl);

        if (response is bool) return null;

        return response.toString();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
