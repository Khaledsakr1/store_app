import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/products_model.dart';

class AllProductsService {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductsModel> productslist = [];

    for (int i = 0; i < data.length; i++) {
      productslist.add(
        ProductsModel.fromJson(data[i]),
      );
    }
    return productslist;
  }
}
