class Classe {
  int _strength;
  int _stamina;
  int _agility;
  int _intelligence;
  int _strengthByLevel;
  int _staminaByLevel;
  int _agilityByLevel;
  int _intelligenceByLevel;

  Classe.Custom(
      this._strength, this._stamina, this._agility, this._intelligence,
      [this._strengthByLevel = 1,
      this._staminaByLevel = 1,
      this._agilityByLevel = 1,
      this._intelligenceByLevel = 1]);

  Classe.Warrior(
      [this._strength = 30,
      this._stamina = 40,
      this._agility = 10,
      this._intelligence = 10,
      this._strengthByLevel = 5,
      this._staminaByLevel = 10,
      this._agilityByLevel = 1,
      this._intelligenceByLevel = 1]);

  Classe.Rogue(
      [this._strength = 15,
      this._stamina = 25,
      this._agility = 40,
      this._intelligence = 10,
      this._strengthByLevel = 3,
      this._staminaByLevel = 5,
      this._agilityByLevel = 10,
      this._intelligenceByLevel = 1]);

  Classe.Mage(
      [this._strength = 10,
      this._stamina = 15,
      this._agility = 10,
      this._intelligence = 50,
      this._strengthByLevel = 1,
      this._staminaByLevel = 3,
      this._agilityByLevel = 3,
      this._intelligenceByLevel = 10]);

  int get strength => this._strength;

  set strength(int value) => this._strength = value;

  int get stamina => this._stamina;

  set stamina(value) => this._stamina = value;

  int get agility => this._agility;

  set agility(value) => this._agility = value;

  int get intelligence => this._intelligence;

  set intelligence(value) => this._intelligence = value;

  int get strengthByLevel => this._strengthByLevel;

  set strengthByLevel(int value) => this._strengthByLevel = value;

  int get staminaByLevel => this._staminaByLevel;

  set staminaByLevel(value) => this._staminaByLevel = value;

  int get agilityByLevel => this._agilityByLevel;

  set agilityByLevel(value) => this._agilityByLevel = value;

  int get intelligenceByLevel => this._intelligenceByLevel;

  set intelligenceByLevel(value) => this._intelligenceByLevel = value;
}
