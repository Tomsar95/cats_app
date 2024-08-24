import 'package:cats_app/features/cats/data/datasources/cats_remote_data_source.dart';
import 'package:cats_app/features/cats/data/repositories/cats_repository_impl.dart';
import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:cats_app/features/core/error/exceptions.dart';
import 'package:cats_app/features/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cats_repository_impl_test.mocks.dart';

@GenerateMocks([
  CatsRemoteDataSource
], customMocks: [
  MockSpec<CatsRemoteDataSource>(
      as: #MockCatsRemoteDataSourceForTest,),
])
void main() {
  late CatsRepositoryImpl repository;
  late MockCatsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockCatsRemoteDataSource();
    repository =
        CatsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getCharacters', () {
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

    const tCats = [tCat];

    test('should return remote data when the call to remote data source is successful', () async {
      //arrange
      when(mockRemoteDataSource.getCats())
          .thenAnswer((_) async => tCats);
      //act
      final result = await repository.getCats();
      //assert
      verify(mockRemoteDataSource.getCats());
      expect(result, equals(const Right(tCats)));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          //arrange
          when(mockRemoteDataSource.getCats())
              .thenThrow(ServerException('ServerException'));
          //act
          final result = await repository.getCats();
          //assert
          verify(mockRemoteDataSource.getCats());
          expect(result, equals(Left(ServerFailure())));
        });
  });
}
