import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:fresp/features/admin/screens/posts_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedindex = 0;
  final List _pages = [
    const PostsScreen(),
    const Center(
      child: Text('Analytics Page'),
    ),
    const Center(
      child: Text('Cart Page'),
    ),
    const Center(
      child: Text('Cart Page'),
    )
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  double bottomBarBorderWidth = 5;
  double bottomBarWidth = 42;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/amazon_in.png',
                      width: 120, height: 45, color: Colors.black),
                ),
                const Text(
                  'Admin',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          ),
        ),
        body: _pages[_selectedindex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          // selectedItemColor: GlobalVariables.selectedNavBarColor,
          // unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          currentIndex: _selectedindex,
          onTap: _selectedPage,
          iconSize: 28,
          items:
              // const <BottomNavigationBarItem>
              [
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _selectedindex == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth)),
                ),
                child: const Icon(FeatherIcons.home),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _selectedindex == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth)),
                ),
                child: const Icon(FeatherIcons.barChart2),
              ),
              label: "Analytics",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _selectedindex == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth)),
                ),
                child: const Icon(FeatherIcons.inbox),
              ),
              label: "All Inbox",
            ),
          ],
        ));
  }
}
