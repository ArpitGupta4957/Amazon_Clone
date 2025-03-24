import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
          itemExtent: 70,
          scrollDirection: Axis.horizontal,
          itemCount: AppGlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
                        arguments: AppGlobalVariables.categoryImages[index]
                            ["title"]!);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppGlobalVariables.categoryImages[index]["image"]!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ),
                Text(
                  AppGlobalVariables.categoryImages[index]["title"]!,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            );
          }),
    );
  }
}
