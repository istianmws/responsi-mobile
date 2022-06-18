import 'base_network.dart';

class CharacterDataSource {
  static CharacterDataSource instance = CharacterDataSource();
  Future<Map<String, dynamic>> loadCharacters() {
    return BaseNetwork.get("characters");
  }
}

class WeaponDataSource {
  static WeaponDataSource instance = WeaponDataSource();
  Future<Map<String, dynamic>> loadWeapons() {
    return BaseNetwork.get("weapons");
  }
}

// class CharacterDetailDataSource {
//   static CharacterDetailDataSource instance = CharacterDetailDataSource();
//   Future<Map<String, dynamic>> loadCharacters(String character) {
//
//   }
// }

// class WeaponDetailDataSource {
//   static WeaponDetailDataSource instance = WeaponDetailDataSource();
//   Future<Map<String, dynamic>> loadWeapon(String weapon) {
//
//   }
// }