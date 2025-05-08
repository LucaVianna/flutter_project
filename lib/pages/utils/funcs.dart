// Função que adiciona item ao carrinho
void addToCart(List<Map<String, dynamic>> cartItems ,Map<String, dynamic> product, Function setStateCallBack) {
  setStateCallBack(() {
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
void increaseQuantity(List<Map<String, dynamic>> cartItems, String productName, Function setStateCallBack) {
  setStateCallBack(() {
    for(var item in cartItems) {
      if (item['name'] == productName) {
        item['quantity'] += 1;
        break;
      }
    }
  });
}

// Função que diminui a quantidade de um item no carrinho ou chama a Função removeFromCart
void decreaseQuantity(List<Map<String, dynamic>> cartItems, String productName, Function setStateCallBack) {
  setStateCallBack(() {
    for(var item in cartItems) {
      if (item['name'] == productName && item['quantity'] > 1) {
        item['quantity'] -= 1;
        break;
      }
      if (item['name'] == productName && item['quantity'] == 1) {
        removeFromCart(cartItems, productName, setStateCallBack);
        break;
      }
    }
  });
}

// Função que remove um item do carrinho
void removeFromCart(List<Map<String, dynamic>> cartItems ,String productName, Function setStateCallBack) {
  setStateCallBack(() {
    cartItems.removeWhere((item) => item['name'] == productName);
  });
}