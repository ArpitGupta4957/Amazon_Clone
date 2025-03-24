import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/common_widgets/circular_loader.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import '../../account/widgets/single_product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  AdminServices _adminServices = AdminServices();
  List<Product> productList = [];
  getData() async {
    productList = await _adminServices.getProducts(context);
    setState(() {
      productList;
    });
  }

  deleteProduct(String id, BuildContext context) async {
    _adminServices.deleteProduct(context, id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 80, left: 10, right: 10),
        itemCount: productList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final productData = productList[index];
          return Column(
            children: [
              SizedBox(
                height: 100,
                child: SingleProduct(
                  image: productData.images[0],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      productData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      loadingWidget(context);
                      deleteProduct(productList[index].id.toString(), context);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
