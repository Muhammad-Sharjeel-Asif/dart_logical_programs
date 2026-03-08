void main() {
  // add_to_cart(1);
  add_to_cart(1);
  // add_to_cart(2);
  add_to_cart(2);
  add_to_cart(3);
  add_to_cart(3);
  print(cart["items"]);
  // show_cart();
}

List<Map<String, dynamic>> products = [
  {"id": 1, "name": "IPhone", "price": 100000},
  {"id": 2, "name": "Realme", "price": 30000},
  {"id": 3, "name": "Oppo", "price": 50000},
];

Map<String, dynamic> cart = {"items": []};

void add_to_cart(int product_id) {
  List cart_items = products.where((item) => item["id"] == product_id).toList();

  int is_exist = cart["items"].indexWhere((e) => e["id"] == product_id);
  print(is_exist);

  if (is_exist != -1) {
    cart["items"][is_exist]["qty"]++;
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