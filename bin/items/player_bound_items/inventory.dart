import '../../utils/item_displayer.dart';
import '../item.dart';
import '../weapons/weapon.dart';

class Inventory {
  List<Item?> _inventory = List.filled(10, null);

  Inventory();

  get inventory => this._inventory;

  set inventory(value) => this._inventory = value;

  void addItem(Item item) {
    for (Item? anitem in _inventory) {
      if (anitem == null) {
        int index = _inventory.indexOf(anitem);
        _inventory[index] = item;
        print(item.name! + " ajouté à l'inventaire à la place $index");
        break;
      }
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
