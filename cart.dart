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
        add_to_cart();
        break;

      case 3:
        cart["items"].isEmpty ? print("Your cart is empty") : show_cart();

      case 5:
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
4. Add more product
5. Exit

Please enter the numbers:""");
}

void add_to_cart() {
  print("Please enter Product ID");
  int product_id = int.parse(stdin.readLineSync() ?? " ");
  (products.where((item) => item["id"] == product_id).toList())
      .map((e) => cart["items"].add(e))
      .toList();
    
    
}

void show_cart() {
  for (var element in cart["items"]) {
    print("""Product ID: ${element["id"]}
Product Name: ${element["name"]}
Product Price: ${element["price"]}""");
  }
}
