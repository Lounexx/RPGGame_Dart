import 'dart:ffi';

import '../items/item.dart';
import '../items/weapons/hammer.dart';
import '../items/weapons/sword.dart';

class LootTable {
  List<Item> _items = List.empty(growable: true);
  List<double> _dropRates = List.empty(growable: true);

  LootTable.Wolf() {
    _addItemToLootTable(Sword(10, 1.25, 1), 0.5);
    _addItemToLootTable(Hammer(100, 1.75, 1), 0.1);
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
