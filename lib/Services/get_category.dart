import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/products_model.dart';

class GetCategory {
  Future<List<ProductsModel>> getAllProducts(
      {required String categoryName}) async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName',);


      List<ProductsModel> productslist = [];

      for (int i = 0; i < data.length; i++) {
        productslist.add(
          ProductsModel.fromJson(data[i]),
        );
      }
      return productslist;
    } 
  }
