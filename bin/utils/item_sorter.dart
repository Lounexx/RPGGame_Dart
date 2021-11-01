import '../items/item.dart';
import '../items/weapons/weapon.dart';

class ItemSort {
  static List<Weapon> getAllWeapons(List<Item> items) {
    List<Weapon> allWeapons = List.empty(growable: true);
    for (Item item in items) {
      if (item is Weapon) {
        allWeapons.add(item);
      }
    }
    return allWeapons;
  }
}
