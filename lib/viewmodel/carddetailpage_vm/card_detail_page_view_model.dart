import 'package:flutter/material.dart';
import 'package:suffa_skipass/models/remote/products/myproducts.dart';
import 'package:suffa_skipass/models/remote/products/products.dart';
import 'package:suffa_skipass/repository/products/buyproduct/buyproduct_repo_impl.dart';

class CardDetailPageViewModel extends ChangeNotifier {
  final BuyProductRepoImpl _buyProductRepo = BuyProductRepoImpl();
  List<ProductModel> productList = [];
  List<MyProductsModel> myProducts = [];
  bool productLoadingState = true;
  bool myProductLoadingState = true;

  Future<bool> getProductData() async {
    dynamic data = await _buyProductRepo.getProducts();
    productLoadingState = false;
    if (data != null) {
      productList = data;
      ChangeNotifier();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getMyProducts() async {
    try {
      dynamic data = await _buyProductRepo.getMyProducts();
      myProductLoadingState = false;
      if (data != null) {
        myProducts = data;
        var productMap = {
          for (var product in productList)
            product.institutionWorkPointCommercialTransactionsID:
                product.institutionWorkPointCommercialTransactionsDisplayText
        };
        for (var myProduct in myProducts) {
          var displayText = productMap[myProduct.productID];
          if (displayText != null) {
            myProduct.institutionWorkPointCommercialTransactionsDisplayText =
                displayText;
          }
        }
        myProducts.sort((a, b) => b.paymentDate.compareTo(a.paymentDate));

        ChangeNotifier();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> buyProduct(int productId) async {
    try {
      return await _buyProductRepo.buyProduct(productId);
    } catch (e) {
      return false;
    }
  }

  Future<String?> createQrCode(String code) async {
    try {
      dynamic data = await _buyProductRepo.createQrCode(code);

      if (data != null) {
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
