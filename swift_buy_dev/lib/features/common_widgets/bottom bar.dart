import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screen/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages=[
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text("Cart Page"),),
  ];
  void updatePage(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: AppGlobalVariables.selectedNavBarColor,
        unselectedItemColor: AppGlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // home page
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 0
                            ? AppGlobalVariables.selectedNavBarColor
                            : AppGlobalVariables.backgroundColor,
                        width: bottomBarBorderWidth),
                  ),
                ),
                child: Icon(Icons.home_outlined),
              ),
              label: ""),
          //account
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 1
                            ? AppGlobalVariables.selectedNavBarColor
                            : AppGlobalVariables.backgroundColor,
                        width: bottomBarBorderWidth),
                  ),
                ),
                child: Icon(Icons.person_outline_outlined),
              ),
              label: ""),
          //cart
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 2
                            ? AppGlobalVariables.selectedNavBarColor
                            : AppGlobalVariables.backgroundColor,
                        width: bottomBarBorderWidth),
                  ),
                ),
                child: badge.Badge(
                  badgeContent: Text('2'),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: ""),
        ],
      ),
    );
  }
}
