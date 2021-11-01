import '../item.dart';

abstract class Potion extends Item {
  late String _description;

  Potion(int levelRequirement) : super(levelRequirement);

  String get description => this._description;

  set description(String value) => this._description = value;
}
