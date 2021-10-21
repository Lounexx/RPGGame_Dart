import '../item.dart';

class Inventory {
  List<Item?> _inventory = List.filled(10, null);

  Inventory();

  get inventory => this._inventory;

  set inventory(value) => this._inventory = value;

  void addItem(Item item) {
    _inventory.add(item);
  }

  void displayInventory() {
    for (Item? item in _inventory) {
      print(item!.name);
    }
  }
}
