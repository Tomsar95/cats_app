import 'package:cats_app/features/cats/data/models/cat_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CatModel', () {
    const tCatModel = CatModel(
      id: 'beng',
      name: 'Bengal',
      description: 'Bengals are a lot of fun to live with...',
      temperament: 'Alert, Agile, Energetic, Demanding, Intelligent',
      origin: 'United States',
      lifeSpan: '12 - 15',
      adaptability: 5,
      affectionLevel: 5,
      childFriendly: 4,
      dogFriendly: 4,
      energyLevel: 5,
      grooming: 3,
      healthIssues: 2,
      intelligence: 5,
      sheddingLevel: 3,
      socialNeeds: 4,
      strangerFriendly: 3,
      vocalisation: 4,
      wikipediaUrl: 'https://en.wikipedia.org/wiki/Bengal_cat',
      imageUrl: 'https://cdn2.thecatapi.com/images/xyz.jpg',
    );

    final tCatJson = {
      'id': 'beng',
      'name': 'Bengal',
      'description': 'Bengals are a lot of fun to live with...',
      'temperament': 'Alert, Agile, Energetic, Demanding, Intelligent',
      'origin': 'United States',
      'life_span': '12 - 15',
      'adaptability': 5,
      'affection_level': 5,
      'child_friendly': 4,
      'dog_friendly': 4,
      'energy_level': 5,
      'grooming': 3,
      'health_issues': 2,
      'intelligence': 5,
      'shedding_level': 3,
      'social_needs': 4,
      'stranger_friendly': 3,
      'vocalisation': 4,
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Bengal_cat',
      'image': 'https://cdn2.thecatapi.com/images/xyz.jpg',
    };

    test('should return a valid model when JSON is provided', () {
      final result = CatModel.fromJson(tCatJson);
      expect(result, tCatModel);
    });

    test('should return a JSON map containing the proper data', () {
      final result = tCatModel.toJson();
      expect(result, tCatJson);
    });

    test('should compare two instances of CatModel correctly', () {
      const secondCatModel = CatModel(
        id: 'beng',
        name: 'Bengal',
        description: 'Bengals are a lot of fun to live with...',
        temperament: 'Alert, Agile, Energetic, Demanding, Intelligent',
        origin: 'United States',
        lifeSpan: '12 - 15',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 4,
        dogFriendly: 4,
        energyLevel: 5,
        grooming: 3,
        healthIssues: 2,
        intelligence: 5,
        sheddingLevel: 3,
        socialNeeds: 4,
        strangerFriendly: 3,
        vocalisation: 4,
        wikipediaUrl: 'https://en.wikipedia.org/wiki/Bengal_cat',
        imageUrl: 'https://cdn2.thecatapi.com/images/xyz.jpg',
      );
      expect(tCatModel, equals(secondCatModel));
    });
  });
}
