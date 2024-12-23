// ignore_for_file: missing_required_param

import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/products_model.dart';

class AddProduct {
  Future<ProductsModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductsModel.fromJson(data);
  }
}
