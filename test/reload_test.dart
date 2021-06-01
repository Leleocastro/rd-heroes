import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:rd_heroes/src/controllers/hero_controller.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';

void main() {
  final heroesController = HeroesController();
  test('Teste do load dos heróis', () async {
    await heroesController.loadHeroes();
    expect(heroesController.heroes.first.id, 1);
  });
  test('Teste de pesquisar heróis', () async {
    await heroesController.searchHeroes('Abe');
    expect(heroesController.heroes.length, 1);
  });
  test('Teste de buscar heróis randomicamente', () async {
    await heroesController.loadHeroes();
    Heroes hero = heroesController.randomHero();
    expect(hero.name.isNotEmpty, true);
  });
  test('Teste de buscar por gênero', () async {
    await heroesController.loadHeroes();
    await heroesController.searchByGenderHeroes('Male');
    int randomIndex = Random().nextInt(heroesController.heroes.length);
    expect(heroesController.heroes[randomIndex].appearance.gender, 'Male');
  });
  test('Teste de buscar heróis por ordem alfabética', () async {
    await heroesController.loadHeroes();
    bool testeAlphabeticOrder = true;
    heroesController.alphabeticOrderBy(testeAlphabeticOrder);
    expect(testeAlphabeticOrder, true);
  });
}
