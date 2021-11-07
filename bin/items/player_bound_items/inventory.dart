import '../../utils/item_displayer.dart';
import '../item.dart';
import '../weapons/weapon.dart';

class Inventory {
  late List<Item?> _inventory;

  Inventory.player() {
    _inventory = List.filled(10, null);
  }

  Inventory.onDeath() {
    _inventory = List.empty(growable: true);
  }

  get inventory => this._inventory;

  set inventory(value) => this._inventory = value;

  void addItem(Item item) {
    bool isFilled = true;
    for (Item? anItem in _inventory) {
      if (anItem == null) {
        int index = _inventory.indexOf(anItem);
        _inventory[index] = item;
        int slot = index + 1;
        print(item.name! + " ajouté à l'inventaire à la place $slot");
        isFilled = false;
        break;
      }
    }
    if (isFilled) {
      print("Inventaire plein");
    }
  }

  void removeItem(Item itemToRemove) {
    for (Item? item in _inventory) {
      if (itemToRemove == item) {
        int index = _inventory.indexOf(item);
        _inventory[index] = null;
      }
    }
  }

  bool isEmpty() {
    bool verif = true;
    for (Item? item in _inventory) {
      if (item != null) {
        verif = false;
        break;
      }
    }
    return verif;
  }
}
