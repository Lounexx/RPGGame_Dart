import 'dart:math';

import '../enemies/skeleton.dart';
import '../enemies/wolf.dart';
import '../entities/entite.dart';
import '../items/weapons/fireable_weapon.dart';

class Randomizer {
  static bool isEventTriggered(double chance) {
    bool verif = false;
    Random random = Random();
    double randomized = random.nextDouble();
    if (randomized <= chance) {
      verif = true;
    }
    return verif;
  }

  static List<Entite> createEnemyWave(int waveSize) {
    List<Entite> enemyTable = [Wolf(1), Skeleton(1)];
    List<Entite> wave = List.empty(growable: true);
    Random random = Random();
    for (int i = 0; i < waveSize; i++) {
      Entite randomizedMonster = enemyTable[random.nextInt(2)];
      int randomizedLevel = 1 + random.nextInt(10);
      if (randomizedMonster is Wolf) {
        wave.add(Wolf(randomizedLevel));
      } else {
        wave.add(Skeleton(randomizedLevel));
      }
      double randomLegendary = random.nextDouble();
      if (randomLegendary > 0 && randomLegendary <= 0.15) {
        wave.add(Skeleton.Jeremy(randomizedLevel + 5));
      }
    }
    return wave;
  }
}
