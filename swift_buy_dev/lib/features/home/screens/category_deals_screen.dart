import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/service/home_service.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = "/category-deals";
  CategoryDealsScreen({super.key, required this.category});
  String category;
  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  bool isLoading = true;
  List<Product> productList = [];
  getData() async {
    setState(() {
      isLoading = true;
    });
    productList =
        await HomeService().getCategoryProduct(context, widget.category);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                BoxDecoration(gradient: AppGlobalVariables.appBarGradient),
          ),
          title: Text(
            widget.category,
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Keep Shopping for ${widget.category} ',
              style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            ),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
                padding: EdgeInsets.only(left: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 10),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 95,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black12, width: 0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.network(productList[index].images[0]),
                          ),
                        ),
                      ),
                      Text(
                        productList[index].name,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
