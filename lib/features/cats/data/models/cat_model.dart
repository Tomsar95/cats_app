import 'package:cats_app/features/cats/domain/entities/cat.dart';

import '../../../core/functions/general_functions.dart';

class CatModel extends Cat {
  const CatModel({
    required super.id,
    required super.name,
    super.description,
    super.temperament,
    super.origin,
    super.lifeSpan,
    super.adaptability,
    super.affectionLevel,
    super.childFriendly,
    super.dogFriendly,
    super.energyLevel,
    super.grooming,
    super.healthIssues,
    super.intelligence,
    super.sheddingLevel,
    super.socialNeeds,
    super.strangerFriendly,
    super.vocalisation,
    super.wikipediaUrl,
    super.imageUrl,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      temperament: json['temperament'],
      origin: json['origin'],
      lifeSpan: json['life_span'],
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation'],
      wikipediaUrl: json['wikipedia_url'],
      imageUrl: GeneralFunctions.setImageRoute(json['reference_image_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'temperament': temperament,
      'origin': origin,
      'life_span': lifeSpan,
      'adaptability': adaptability,
      'affection_level': affectionLevel,
      'child_friendly': childFriendly,
      'dog_friendly': dogFriendly,
      'energy_level': energyLevel,
      'grooming': grooming,
      'health_issues': healthIssues,
      'intelligence': intelligence,
      'shedding_level': sheddingLevel,
      'social_needs': socialNeeds,
      'stranger_friendly': strangerFriendly,
      'vocalisation': vocalisation,
      'wikipedia_url': wikipediaUrl,
      'image': imageUrl,
    };
  }
}
