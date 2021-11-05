import '../../entite.dart';
import '../consummable.dart';
import '../item.dart';
import '../potion.dart';

class HealthPotion extends Potion implements Consummable {
  int _healthRecovery;

  HealthPotion.standard([this._healthRecovery = 10]) : super(1) {
    super.name = "Potion de soin";
    super.description = "Potion de soin qui redonne $healthRecovery HP";
  }

  HealthPotion.exilir([this._healthRecovery = 25]) : super(10) {
    super.name = "Elixir de soin";
    super.description = "Potion de soin qui redonne $healthRecovery HP";
  }

  int get healthRecovery => this._healthRecovery;

  set healthRecovery(int value) => this._healthRecovery = value;

  @override
  void consume(Entite entite) {
    entite.health = entite.health + _healthRecovery;
    print(entite.name +
        " a bu " +
        super.name! +
        " lui redonnant $healthRecovery HP!");
  }
}
