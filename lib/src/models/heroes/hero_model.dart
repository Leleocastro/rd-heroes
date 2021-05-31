import 'package:flutter/material.dart';

import 'description/appearance.dart';
import 'description/biography.dart';
import 'description/connections.dart';
import 'description/images.dart';
import 'description/power_stats.dart';
import 'description/work.dart';

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
