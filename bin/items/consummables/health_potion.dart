import '../../entite.dart';
import '../consummable.dart';
import '../item.dart';

class HealthPotion extends Item implements Consummable {
  int _healthRecovery;

  HealthPotion.standard([this._healthRecovery = 10]) : super(1) {
    super.name = "Potion de soin";
  }

  HealthPotion.exilir([this._healthRecovery = 25]) : super(10) {
    super.name = "Elixir de soin";
  }

  int get healthRecovery => this._healthRecovery;

  set healthRecovery(int value) => this._healthRecovery = value;

  @override
  void consume(Entite entite) {
    entite.health = entite.health + _healthRecovery;
  }
}
