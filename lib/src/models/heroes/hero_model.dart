import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rd_heroes/src/utils/constants.dart';

import 'description/appearence.dart';
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
  final Appearence appearence;
  final Biography biography;
  final Work work;
  final Connections connections;
  final Images images;

  Heroes({
    this.id,
    this.name,
    this.slug,
    this.powerStats,
    this.appearence,
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
        ));
  }
}
