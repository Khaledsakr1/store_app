import 'package:flutter/material.dart';
import 'package:store_app/Models/products_model.dart';
import 'package:store_app/Screens/update_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({required this.products});

  ProductsModel products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id , arguments: products);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                blurRadius: 40,
                spreadRadius: 0, // مسافه الريدياس بتاع الشادو
                offset: const Offset(10, 10),
              )
            ]),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products.title.substring(0, 10),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${products.price}'),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 55,
            bottom: 85,
            child: Image.network(
              products.image,
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
