import 'package:amazonclone/constants/features/accounts/screens/account_screen.dart';
import 'package:amazonclone/constants/features/home/screen/home_screen.dart';
import 'package:amazonclone/constants/global_variables.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routename = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  // ignore: non_constant_identifier_names
  double BottomNavigationBarWidth = 42;
  // ignore: non_constant_identifier_names
  double BottomBarBorder = 5;

  void updatepage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildPage(_page)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 26,
        onTap: updatepage,
        items: [
          // home
          BottomNavigationBarItem(
            icon: Container(
              width: BottomNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: BottomBarBorder))),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          // profile
          BottomNavigationBarItem(
            icon: Container(
              width: BottomNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: BottomBarBorder))),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
          // cart
          BottomNavigationBarItem(
            icon: Container(
              width: BottomNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: BottomBarBorder))),
              child: const badges.Badge(
                badgeContent: Text('1'),
                badgeStyle: badges.BadgeStyle(
                    elevation: 0,
                    badgeColor: Color.fromARGB(255, 242, 238, 238)),
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Builder(builder: (context) {
          return const HomeScreen();
        });
      case 1:
        return const AccountScreen();
      case 2:
        return const Center(
          child: Text('cart pagesdfdg'),
        );
      default:
        return Container();
    }
  }
}
