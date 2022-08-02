
import'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fresp/features/auth/screens/cart.dart';
import 'package:fresp/features/auth/screens/categories.dart';
import 'package:fresp/features/auth/screens/homescreen.dart';
import 'package:fresp/features/auth/screens/user.dart';



class BottomBarScreen extends StatefulWidget{
  const BottomBarScreen({Key? key}):super(key: key);

  @override 
  State<BottomBarScreen> createState() => _BottomBarScreenState();

}
class _BottomBarScreenState extends State<BottomBarScreen>{
  int _selectedindex = 0;
  final List _pages =[
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const UserScreen(),
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedindex,
        onTap: _selectedPage,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: "Home",),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.category),
            label: "Categories",),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            label: "Cart",),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.user2),
            label: "User",),
        ],
      ),

    );
  }
}