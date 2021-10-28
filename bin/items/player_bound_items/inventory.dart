import '../../utils/item_displayer.dart';
import '../item.dart';
import '../weapons/weapon.dart';

class Inventory {
  List<Item?> _inventory = List.filled(10, null);

  Inventory();

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

  void displayInventory() {
    List<Weapon> weapons = List.empty(growable: true);
    for (Item? item in _inventory) {
      if (item != null && item is Weapon) {
        weapons.add(item);
      }
    }
    ItemDisplayer.displayAllWeapons(weapons);
  }

  List<Item> searchItem(String itemName) {
    List<Item> items = List.empty(growable: true);
    for (Item? item in _inventory) {
      if (item != null && item.name!.toLowerCase() == itemName) {
        items.add(item);
      }
    }
    return items;
  }
}
