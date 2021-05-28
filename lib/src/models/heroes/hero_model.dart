import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rd_heroes/src/utils/constants.dart';

import 'description/appearance.dart';
import 'description/biography.dart';
import 'description/connections.dart';
import 'description/images.dart';
import 'description/power_stats.dart';
import 'description/work.dart';
import 'package:http/http.dart' as http;

class Heroes with ChangeNotifier {
  final int id;
  final String name;
  final String slug;
  final PowerStats powerStats;
  final Appearance appearance;
  final Biography biography;
  final Work work;
  final Connections connections;
  final Images images;

  Heroes({
    this.id,
    this.name,
    this.slug,
    this.powerStats,
    this.appearance,
    this.biography,
    this.work,
    this.connections,
    this.images,
  });

  List<Heroes> _heroes = [];

  List<Heroes> get heroes => [..._heroes];

  final String _url = Constants.BASE_API_URL;
  final String _urlHeroes = Constants.BASE_API_ALLHEROES;

  Uri get _baseUrl {
    return Uri.https(_url, _urlHeroes);
  }

  Future<void> loadHeroes() async {
    // print(_url);
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

  factory Heroes.fromJson(Map<String, dynamic> json) {
    return Heroes(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      images: Images(
        xs: json['images']['xs'],
        sm: json['images']['sm'],
        md: json['images']['md'],
        lg: json['images']['lg'],
      ),
      powerStats: PowerStats(
        combat: json['powerstats']['combat'],
        durability: json['powerstats']['durability'],
        intelligence: json['powerstats']['intelligence'],
        power: json['powerstats']['power'],
        speed: json['powerstats']['speed'],
        strength: json['powerstats']['strength'],
      ),
      appearance: Appearance(
        eyeColor: json['appearance']['eyeColor'],
        gender: json['appearance']['gender'],
        hairColor: json['appearance']['hairColor'],
        height: json['appearance']['height'],
        race: json['appearance']['race'],
        weight: json['appearance']['weight'],
      ),
      biography: Biography(
        aliases: json['biography']['aliases'],
        alignment: json['biography']['alignment'],
        alterEgos: json['biography']['alterEgos'],
        firstAppearance: json['biography']['firstAppearance'],
        fullName: json['biography']['fullName'],
        placeOfBirth: json['biography']['placeOfBirth'],
        publisher: json['biography']['publisher'],
      ),
      connections: Connections(
        groupAffiliation: json['connections']['groupAffiliation'],
        relatives: json['connections']['relatives'],
      ),
      work: Work(
        base: json['work']['base'],
        occupation: json['work']['occupation'],
      ),
    );
  }
}
