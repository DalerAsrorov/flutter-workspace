import 'dart:collection';

class Product {
  final int id;
  final double price;
  final String title;

  Product(this.id, this.price, this.title);

  @override
  String toString() {
    return 'Price of ${title} is \$${price}';
  }
}

class Inventory {
  final int amount;

  Inventory(this.amount);

  @override
  String toString() {
    return 'Inventory amount: $amount';
  }
}

class Store<P, I> {
  final HashMap<P, I> catalog = HashMap<P, I>();

  List<P> get products => catalog.keys.toList();

  void updateInventory(P product, I inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach((product) {
      print('Product: ${product}, ' + catalog[product].toString());
    });
  }
}

class MyStore<MyProduct, MyInventory> {
  final HashMap<MyProduct, MyInventory> catalog =
      HashMap<MyProduct, MyInventory>();

  List<MyProduct> get products => catalog.keys;

  void updateInventory(MyProduct product, MyInventory inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach(
      (product) => print('Product: ${product}, ' + catalog[product].toString()),
    );
  }
}

/**
 * Function's return type(T)
 */
T lastItem<T>(List<T> products) {
  return products.last;
}

void main() {
  var milk = Product(1, 5.99, 'Milk');
  var bread = Product(2, 4.50, 'Bread');
  var cheese = Product(3, 6.50, 'Cheese');

  //Using single letter names for Generics
  var store1 = Store<Product, Inventory>();

  store1.updateInventory(cheese, Inventory(100));
  store1.updateInventory(milk, Inventory(20));
  store1.updateInventory(bread, Inventory(15));
  store1.printProducts();

  print(lastItem(store1.products));

  //Using descriptive names for Generics
  // var store2 = MyStore<Product, Inventory>();
  // store2.updateInventory(milk, Inventory(20));
  // store2.updateInventory(bread, Inventory(15));
  // store2.printProducts();

  // print(lastItem(store1.products));
}
