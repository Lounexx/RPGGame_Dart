import 'dart:math';

import '../enemies/skeleton.dart';
import '../enemies/wolf.dart';
import '../entite.dart';

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
      Entite randomizedMonster = enemyTable[random.nextInt(1)];
      int randomizedLevel = random.nextInt(10);
      if (randomizedMonster is Wolf) {
        wave.add(Wolf(randomizedLevel));
      } else {
        wave.add(Skeleton(randomizedLevel));
      }
    }
    return wave;
  }
}
