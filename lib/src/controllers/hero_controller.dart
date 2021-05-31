import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';
import 'package:rd_heroes/src/utils/constants.dart';

import 'package:http/http.dart' as http;

class HeroesController with ChangeNotifier {
  final String _url = Constants.BASE_API_URL;
  final String _urlHeroes = Constants.BASE_API_ALLHEROES;

  Uri get _baseUrl {
    return Uri.https(_url, _urlHeroes);
  }

  List<Heroes> _heroes = Heroes().heroes;

  List<Heroes> get heroes => _heroes;

  Future<void> loadHeroes() async {
    final response = await http.get(_baseUrl);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      _heroes.clear();

      if (data != null) {
        _heroes = data.map<Heroes>((json) => Heroes.fromJson(json)).toList();
        notifyListeners();
      }
      return Future.value();
    } else {
      print(response.statusCode);
    }
  }

  searchHeroes(String nameSearch) async {
    await loadHeroes();
    List<Heroes> heroesSearch = List.from(_heroes);
    _heroes.clear();
    heroesSearch.forEach((hero) {
      if (hero.name.contains(nameSearch)) {
        _heroes.add(hero);
      }
    });
    notifyListeners();
  }

  searchByGenderHeroes(String nameSearch) async {
    await loadHeroes();
    if (nameSearch != '') {
      List<Heroes> heroesSearch = List.from(_heroes);
      _heroes.clear();
      heroesSearch.forEach((hero) {
        if (hero.appearance.gender == nameSearch) {
          _heroes.add(hero);
        }
      });
    }
    notifyListeners();
  }

  randomHero() {
    int randomIndex = Random().nextInt(_heroes.length);
    return _heroes[randomIndex];
  }

  bool alphabeticOrderBy(bool isAscending) {
    if (isAscending) {
      _heroes.sort((a, b) {
        var aName = a.name;
        var bName = b.name;
        return aName.compareTo(bName);
      });
      notifyListeners();
      return false;
    } else {
      _heroes.sort((a, b) {
        var aName = a.name;
        var bName = b.name;
        return -aName.compareTo(bName);
      });
      notifyListeners();
      return true;
    }
  }
}
