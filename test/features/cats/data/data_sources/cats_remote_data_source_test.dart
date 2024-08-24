import 'dart:convert';

import 'package:cats_app/features/cats/data/datasources/cats_remote_data_source.dart';
import 'package:cats_app/features/cats/data/models/cat_model.dart';
import 'package:cats_app/features/core/error/exceptions.dart';
import 'package:cats_app/features/core/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';


import '../../../../fixtures/fixture_reader.dart';
import 'cats_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late CatsRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = CatsRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockkHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) => Future.value(http.Response(fixture('cats.json'), 200)));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) => Future.value(http.Response('something went wrong', 404)));
  }

  group('getCats', () {

    final List<dynamic> jsonList = json.decode(fixture('cats.json'));
    final tCats = jsonList.map((json) => CatModel.fromJson(json)).toList();

    test(
        'should perform a GET request on a URL with application/json header',
            () async {
          //arrange
          setUpMockkHttpClientSuccess200();
          //act
          dataSource.getCats();
          //assert
          verify(mockHttpClient.get(
            Uri.parse(Utils.root),
            headers: {'Content-Type': 'application/json'},
          ));
        });

    test('should return List<Cats> when response code is 200',() async {
      //arrange
      setUpMockkHttpClientSuccess200();
      //act
      final result = await dataSource.getCats();
      //assert
      expect(result, equals(tCats));
    });

    test('should throw ServerException when response code is 404 or other',() async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = dataSource.getCats;
      //assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });

}