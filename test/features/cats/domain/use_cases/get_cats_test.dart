import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';
import 'package:cats_app/features/cats/domain/use_cases/get_cats.dart';
import 'package:cats_app/features/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cats_test.mocks.dart';


@GenerateMocks([CatsRepository])
void main() {
  late final GetCats useCase;
  late final MockCatsRepository mockCatsRepository;

  setUp(() {
    mockCatsRepository = MockCatsRepository();
    useCase = GetCats(mockCatsRepository);
  });

  const tCat = Cat(
    id: 'abc123',
    name: 'Bengal',
    description: 'A highly active and playful breed.',
    temperament: 'Alert, Agile, Energetic, Demanding, Intelligent',
    origin: 'United States',
    lifeSpan: '12 - 16 years',
    adaptability: 5,
    affectionLevel: 5,
    childFriendly: 4,
    dogFriendly: 4,
    energyLevel: 5,
    grooming: 3,
    healthIssues: 3,
    intelligence: 5,
    sheddingLevel: 3,
    socialNeeds: 4,
    strangerFriendly: 4,
    vocalisation: 3,
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Bengal_(cat)',
    imageUrl: 'https://cdn2.thecatapi.com/images/W5mCy2qxC.jpg',
  );

  const List<Cat> tListCats = [tCat];

  test('should get List<Character> from the repository', () async {
    // arrange
    when(mockCatsRepository.getCats())
        .thenAnswer((_) async => const Right(tListCats));
    // act
    final result = await useCase(NoParams());
    // assert
    expect(result, const Right(tListCats));
    verify(mockCatsRepository.getCats());
    verifyNoMoreInteractions(mockCatsRepository);
  });
}
