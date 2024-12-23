import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/products_model.dart';

class UpdateService {
  Future<ProductsModel> update({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    print('products id = $id');
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().put(url:'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductsModel.fromJson(data);
  }
}
