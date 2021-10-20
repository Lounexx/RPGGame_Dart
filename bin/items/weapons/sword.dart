import 'weapon.dart';

class Sword extends Weapon {
  Sword(int damage, double critMultiplier, int levelRequirement)
      : super(damage, critMultiplier, levelRequirement) {
    super.name = "Sword";
  }
}
