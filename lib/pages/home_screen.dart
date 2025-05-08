import 'package:flutter/material.dart';
import './home/shop_screen.dart';
import './home/favorite_screen.dart';
import './home/explore_screen.dart';
import './home/cart_screen.dart';
import './utils/funcs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> cartItems = [];

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      ShopScreen(addToCart: (product, quantity) => addToCart(cartItems, product, quantity, setState)),
      ExploreScreen(),
      CartScreen(
        cartItems: cartItems,
        increaseQuantity: (productName) => increaseQuantity(cartItems, productName, setState),
        decreaseQuantity: (productName) => decreaseQuantity(cartItems, productName, setState),
        removeFromCart: (productName) => removeFromCart(cartItems, productName, setState),
      ),
      FavoriteScreen(),
      //ProfileScreen(),
    ]);
  }

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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          //BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}