import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home/shop_screen.dart';
import 'package:flutter_project/pages/home/favorite_screen.dart';
import 'package:flutter_project/pages/home/explore_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ShopScreen(),
    ExploreScreen(),
    //CartScreen(),
    FavoriteScreen(),
    //ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Loja'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'),
          //BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          //BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }



}