import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        product.imageLink,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Obx(() => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: product.isFavorite.value
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                product.isFavorite.toggle();
                              },
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(product.name,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: 'avenir', fontWeight: FontWeight.w800),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 8),
              if (product.rating != null)
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.rating.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 8),
              Center(
                child: Text('\$${product.price}',
                    style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
