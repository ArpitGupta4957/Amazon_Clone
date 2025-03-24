import 'package:amazon_clone/features/common_widgets/stars.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  const SearchedProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.fitHeight,
                  height: 135,
                  width: 135,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 165,
                      child: Text(
                        product.name,
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                    Stars(rating: 3.6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 165,
                      child: Text(
                        '₹ ${product.price}',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Text("Eligible for FREE Shipping"),
                    Text(
                      "In Stock",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
