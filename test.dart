void main() {
  add_to_cart(1);
  // add_to_cart(1);
  // add_to_cart(2);
  // print(cart["items"]);
  show_cart();
}

List<Map<String, dynamic>> products = [
  {"id": 1, "name": "IPhone", "price": 100000},
  {"id": 2, "name": "Realme", "price": 30000},
  {"id": 3, "name": "Oppo", "price": 50000},
];

Map<String, dynamic> cart = {"items": []};

void show_products() {
  for (var item in products) {
    print("""Product ID: ${item["id"]}
Product Name: ${item["name"]}
Product Price: ${item["price"]}
""");
  }
}

void show_menu() {
  print("""================MENU================
1. Show Products
2. Add to Cart
3. Show Cart
4. Add more product
5. Exit

Please enter the numbers:""");
}

void add_to_cart(int product_id) {
  List cart_items = products.where((item) => item["id"] == product_id).toList();

  int is_exist = cart_items.indexWhere((e) => e["id"] == product_id);
  print(is_exist);
  if (is_exist == -1) {
    cart_items
        .map(
          (e) => cart["items"].add({
            "id": e["id"],
            "name": e["name"],
            "price": e["price"],
            "qty": e["qty"] = 2,
          }),
        )
        .toList();
  } else {
    cart_items
        .map(
          (e) => cart["items"].add({
            "id": e["id"],
            "name": e["name"],
            "price": e["price"],
            "qty": 1,
          }),
        )
        .toList();
  }
    // print(cart["items"][0]["name"]);
}

void show_cart() {
  for (var element in cart["items"]) {
    print("""Product ID: ${element["id"]}
Product Name: ${element["name"]}
Product Price: ${element["price"]}
Quantity: ${element["qty"]}""");
  }
}
