import '../../../models/remote/products/myproducts.dart';
import '../../../models/remote/products/products.dart';

abstract class BuyProductRepo {
  Future<List<ProductModel>?> getProducts();

  Future<bool> buyProduct(int productId);

  Future<List<MyProductsModel>?> getMyProducts();
}
