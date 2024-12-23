import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Models/products_model.dart';
import 'package:store_app/Services/update.dart';
import 'package:store_app/Widgets/Button.dart';
import 'package:store_app/Widgets/Textfield.dart';

// ignore: must_be_immutable
class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'update page';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productName, desc, image;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel products =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent, // take color of scaffold
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Update Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Textfield(
                      onchanged: (data) {
                        productName = data;
                      },
                      headtextfield: 'Product Name',
                    ),
                    const SizedBox(height: 20),
                    Textfield(
                        onchanged: (data) {
                          desc = data;
                        },
                        headtextfield: 'Description'),
                    const SizedBox(height: 20),
                    Textfield(
                        onchanged: (data) {
                          price = data;
                        },
                        inputType: TextInputType.number,
                        headtextfield: 'Price'),
                    const SizedBox(height: 20),
                    Textfield(
                        onchanged: (data) {
                          image = data;
                        },
                        headtextfield: 'Image'),
                    const SizedBox(height: 50),
                    Button(
                        ontap: () async{
                          isLoading = true;

                          setState(() {});

                          try {
                           await updateProducts(products);
                            print('sucsees');
                          } catch (e) {
                            print(e.toString());
                          }

                          isLoading = false;
                          setState(() {});
                        },
                        title: 'Update'),
                  ],
                ),
              ),
            ),
          )),
    );
  }

 Future<void> updateProducts(ProductsModel products) async{
   await  UpdateService().update(
      id: products.id,
      title: productName == null ? products.title : productName!,
      price: price == null ? products.price.toString() : price!,
      description: desc == null ? products.description : desc!,
      image: image == null ? products.image : image!,
      category: products.category,
    );
  }
}
