import 'dart:io';

void main() {
  while (true) {
    show_menu();
    int user_input = int.parse(stdin.readLineSync() ?? " ");

    switch (user_input) {
      case 1:
        show_products();
        break;

      case 2:
        print("Please enter Product ID");
        int product_id = int.parse(stdin.readLineSync() ?? " ");
        add_to_cart(product_id);
        break;

      case 3:
        cart["items"].isEmpty ? print("Your cart is empty\n") : show_cart();

      case 4:
        cart["items"].isEmpty
            ? print("Thank you for coming!")
            : print("Thank you for shopping!");
        return;
      default:
        print("Please enter valid number");
    }
  }
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
4. Exit

Please enter the numbers:""");
}

void add_to_cart(int product_id) {
  List matched_id = products.where((item) => item["id"] == product_id).toList();

  int isExist = cart["items"].indexWhere((e) => e["id"] == product_id);

  if (isExist != -1) {
    cart["items"][isExist]["qty"]++;
  } else {
    matched_id
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
}

void show_cart() {
  for (var element in cart["items"]) {
    print("""Product ID: ${element["id"]}
Product Name: ${element["name"]}
Product Price: ${element["price"]}
Quantity: ${element["qty"]}
""");
  }
}
