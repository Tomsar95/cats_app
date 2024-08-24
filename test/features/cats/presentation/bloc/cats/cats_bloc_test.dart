import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:cats_app/features/cats/domain/use_cases/get_cats.dart';
import 'package:cats_app/features/cats/presentation/blocs/cats_bloc/cats_bloc.dart';
import 'package:cats_app/features/core/error/failures.dart';
import 'package:cats_app/features/core/usecases/usecase.dart';
import 'package:cats_app/features/core/utils/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cats_bloc_test.mocks.dart';


@GenerateMocks([GetCats])
void main() {
  late MockGetCats mockGetCats;
  late CatsBloc bloc;

  setUp(() {
    mockGetCats = MockGetCats();
    bloc = CatsBloc(getCats: mockGetCats);
  });

  group('GetCats',(){
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

    test('initial state should be loading', () async {
      //assert
      expect(bloc.state, equals(const CatsInitial(isLoading: true)));
    });

    test('Should get data from the cats use case', () async* {
      //arrange
      when(mockGetCats(NoParams()))
          .thenAnswer((_) async => const Right(tListCats));
      //act
      bloc.add(GetCatsEvent());
      await untilCalled(mockGetCats(NoParams()));

      //assert
      verify(mockGetCats(NoParams()));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
            () async* {
          //arrange
          when(mockGetCats(any))
              .thenAnswer((_) async => const Right(tListCats));
          //assert later
          final expected = [
            const CatsInitial(isLoading: true),
            const LoadedCatsState(listOfCats: tListCats),
          ];
          expectLater(bloc, emitsInOrder(expected));
          //act
          bloc.add(GetCatsEvent());
        });

    test('should emit [Loading, Error] when getting data fails', () async* {
      //arrange
      when(mockGetCats(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      //assert later
      final expected = [
        const CatsInitial(isLoading: true),
        const ErrorState(message: Utils.serverFailureMessage)
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetCatsEvent());
    });
  });
}