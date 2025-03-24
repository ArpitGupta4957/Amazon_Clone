import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/features/admin/screen/posts_screen.dart';
// import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    PostsScreen(),
    const Center(
      child: Text("Analytics Page"),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }
  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: navigateToAddProduct,
        tooltip: "Add a Product",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: AppGlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/logo without bg.png",
                  scale: 3.5,
                ),
              ),
              Text(
                "Admin",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 3,
        // currentIndex: _page,
        // selectedItemColor: AppGlobalVariables.selectedNavBarColor,
        // unselectedItemColor: AppGlobalVariables.unselectedNavBarColor,
        // iconSize: 28,
        // onTap: updatePage,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // home page
            SizedBox(
              width: 60,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _page = 0;
                  });
                },
                icon: Icon(Icons.home_outlined)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _page = 1;
                  });
                },
                icon: Icon(Icons.person_outline_outlined)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _page = 2;
                  });
                },
                icon: Icon(Icons.all_inbox_outlined)),
            // BottomNavigationBarItem(
            //     icon: Container(
            //       width: bottomBarWidth,
            //       decoration: BoxDecoration(
            //         border: Border(
            //           top: BorderSide(
            //               color: _page == 0
            //                   ? AppGlobalVariables.selectedNavBarColor
            //                   : AppGlobalVariables.backgroundColor,
            //               width: bottomBarBorderWidth),
            //         ),
            //       ),
            //       child: ,
            //     ),
            //     label: ""),
            // //analytics
            // BottomNavigationBarItem(
            //     icon: Container(
            //       width: bottomBarWidth,
            //       decoration: BoxDecoration(
            //         border: Border(
            //           top: BorderSide(
            //               color: _page == 1
            //                   ? AppGlobalVariables.selectedNavBarColor
            //                   : AppGlobalVariables.backgroundColor,
            //               width: bottomBarBorderWidth),
            //         ),
            //       ),
            //       child: Icon(Icons.person_outline_outlined),
            //     ),
            //     label: ""),
            //
            // //orders
            // BottomNavigationBarItem(
            //     icon: Container(
            //       width: bottomBarWidth,
            //       decoration: BoxDecoration(
            //         border: Border(
            //           top: BorderSide(
            //               color: _page == 2
            //                   ? AppGlobalVariables.selectedNavBarColor
            //                   : AppGlobalVariables.backgroundColor,
            //               width: bottomBarBorderWidth),
            //         ),
            //       ),
            //       child: Icon(Icons.all_inbox_outlined),
            //     ),
            //     label: ""),
          ],
        ),
      ),
      body: pages[_page],
    );
  }
}
