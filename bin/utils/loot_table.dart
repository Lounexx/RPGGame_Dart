import 'dart:ffi';

import '../items/consummables/health_potion.dart';
import '../items/item.dart';
import '../items/weapons/hammer.dart';
import '../items/weapons/sword.dart';

class LootTable {
  List<Item> _items = List.empty(growable: true);
  List<double> _dropRates = List.empty(growable: true);

  LootTable.Wolf() {
    _addItemToLootTable(Sword(10, 1.25, 1), 0.5);
    _addItemToLootTable(Hammer(100, 1.75, 1), 0.1);
    _addItemToLootTable(HealthPotion.standard(), 0.4);
  }
  LootTable.Skeleton() {
    _addItemToLootTable(Sword(35, 1.5, 7), 0.3);
    _addItemToLootTable(Hammer(65, 1.2, 10), 0.2);
    _addItemToLootTable(HealthPotion.standard(), 0.4);
    _addItemToLootTable(HealthPotion.exilir(), 0.3);
  }

  LootTable.SkeletonJeremy() {
    _addItemToLootTable(Sword(35, 1.5, 7), 0.3);
    _addItemToLootTable(Hammer(65, 1.2, 10), 0.2);
    _addItemToLootTable(HealthPotion.standard(), 0.4);
    _addItemToLootTable(HealthPotion.exilir(), 0.3);
    _addItemToLootTable(Hammer.UniqueHammer(), 0.05);
  }
  LootTable.Dog() {
    _addItemToLootTable(Sword(35, 1.5, 7), 0.3);
    _addItemToLootTable(HealthPotion.standard(), 0.4);
    _addItemToLootTable(HealthPotion.exilir(), 0.3);
    _addItemToLootTable(Hammer.UniqueHammer(), 0.05);
  }

  List<Item> get items => this._items;

  set items(List<Item> value) => this._items = value;

  List<double> get dropRates => this._dropRates;

  set dropRates(value) => this._dropRates = value;

  void _addItemToLootTable(Item item, double dropRate) {
    _items.add(item);
    _dropRates.add(dropRate);
  }
}
