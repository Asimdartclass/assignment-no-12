import 'dart:io';

// Class to represent a MenuItem
class MenuItem {
  String name;
  double price;

  MenuItem({required this.name, required this.price});

  void displayItem() {
    print('$name: \$${price.toStringAsFixed(2)}');
  }
}

// Class to represent an Order
class Order {
  List<MenuItem> items = [];

  void addItem(MenuItem item) {
    items.add(item);
    print('${item.name} added to your order.');
  }

  void displayOrder() {
    if (items.isEmpty) {
      print('Your order is empty!');
    } else {
      print('Your order:');
      for (var item in items) {
        item.displayItem();
      }
    }
  }

  double calculateTotal() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }

  void displayBill() {
    if (items.isEmpty) {
      print('No items ordered.');
    } else {
      print('Bill Summary:');
      displayOrder();
      print('Total: \$${calculateTotal().toStringAsFixed(2)}');
    }
  }
}

// Class to represent the Restaurant Management System
class RestaurantSystem {
  List<MenuItem> menu = [
    MenuItem(name: 'Burger', price: 5.99),
    MenuItem(name: 'Pizza', price: 8.99),
    MenuItem(name: 'Pasta', price: 7.49),
    MenuItem(name: 'Salad', price: 4.99),
    MenuItem(name: 'Soda', price: 1.99),
  ];

  Order currentOrder = Order();

  void displayMenu() {
    print('Menu:');
    for (var item in menu) {
      item.displayItem();
    }
  }

  void placeOrder() {
    while (true) {
      print('\nEnter the item name to order or type "done" to finish:');
      String? itemName = stdin.readLineSync();

      if (itemName?.toLowerCase() == 'done') {
        break;
      }

      MenuItem? menuItem = menu.firstWhere(
          (item) => item.name.toLowerCase() == itemName?.toLowerCase(),
          orElse: () => MenuItem(name: '', price: 0));

      if (menuItem.name.isNotEmpty) {
        currentOrder.addItem(menuItem);
      } else {
        print('Item not found. Please try again.');
      }
    }
  }

  void viewOrder() {
    currentOrder.displayOrder();
  }

  void viewBill() {
    currentOrder.displayBill();
  }
}

void main() {
  RestaurantSystem restaurant = RestaurantSystem();

  while (true) {
    print('\nRestaurant Management System');
    print('1. View Menu');
    print('2. Place Order');
    print('3. View Order');
    print('4. View Bill');
    print('5. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        restaurant.displayMenu();
        break;
      case '2':
        restaurant.placeOrder();
        break;
      case '3':
        restaurant.viewOrder();
        break;
      case '4':
        restaurant.viewBill();
        break;
      case '5':
        print('Thank you for visiting!');
        return;
      default:
        print('Invalid choice! Please try again.');
    }
  }
}



