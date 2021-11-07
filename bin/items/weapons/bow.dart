import 'fireable_weapon.dart';

class Bow extends FireableWeapon {
  Bow(int damage, double critMultiplier, int levelRequirement, double hitChance)
      : super(damage, critMultiplier, levelRequirement, hitChance);
  Bow.standard() : super(75, 1, 1, 0.75) {
    super.name = "Arc standard";
  }
}
