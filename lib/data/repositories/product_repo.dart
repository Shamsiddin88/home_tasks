import 'package:home_tasks/data/models/my_response.dart';
import 'package:home_tasks/data/models/product_model.dart';
import 'package:home_tasks/data/network/api_provider.dart';

class ProductRepo {
  Future<MyResponse> getAllProducts() => ApiProvider.getAllProducts();

  Future<MyResponse> addProduct(ProductModel productModel) =>
      ApiProvider.addProduct(productModel);

  Future<MyResponse> deleteProduct(String productUUID) =>
      ApiProvider.deleteProduct(productUUID);

  Future<MyResponse> updateProduct(ProductModel productModel) =>
      ApiProvider.updateProduct(productModel);
}
