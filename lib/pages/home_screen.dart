import 'package:flutter/material.dart';
import './home/shop_screen.dart';
import './home/favorite_screen.dart';
import './home/explore_screen.dart';
import './home/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> cartItems = [];

  // Função que adiciona item ao carrinho
  void addToCart(Map<String, dynamic> product) {
    setState(() {
      bool exists = false;
      for (var item in cartItems) {
        if (item['name'] == product['name']) {
          item['quantity'] += 1;
          exists = true;
          break;
        }
      }
      if (!exists) {
        cartItems.add({...product, 'quantity': 1});
      }
    });
  }

  // Função que aumenta a quantidade de um item no carrinho
  void increaseQuantity(String productName) {
    setState(() {
      for(var item in cartItems) {
        if (item['name'] == productName) {
          item['quantity'] += 1;
          break;
        }
      }
    });
  }

  // Função que diminui a quantidade de um item no carrinho ou chama a Função removeFromCart
  void decreaseQuantity(String productName) {
    setState(() {
      for(var item in cartItems) {
        if (item['name'] == productName && item['quantity'] > 1) {
          item['quantity'] -= 1;
          break;
        }
        if (item['name'] == productName && item['quantity'] == 1) {
          removeFromCart(productName);
        }
      }
    });
  }

  // Função que remove um item do carrinho
  void removeFromCart(String productName) {
    setState(() {
      cartItems.removeWhere((item) => item['name'] == productName);
    });
  }

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      ShopScreen(addToCart: addToCart),
      ExploreScreen(),
      CartScreen(
        cartItems: cartItems,
        increaseQuantity: increaseQuantity,
        decreaseQuantity: decreaseQuantity,
        removeFromCart: removeFromCart,
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