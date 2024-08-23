import 'dart:convert';
import 'package:cats_app/features/cats/data/models/cat_model.dart';
import 'package:cats_app/features/core/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../../../core/error/exceptions.dart';
import '../../domain/entities/cat.dart';

abstract class CatsRemoteDataSource {

  Future<List<Cat>> getCats();
}

class CatsRemoteDataSourceImpl implements CatsRemoteDataSource {
  final http.Client client;

  CatsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Cat>> getCats() {
    return _getCatsFromUrl(Utils.root);
  }

  Future<List<CatModel>> _getCatsFromUrl(String url) async{
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200){
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => CatModel.fromJson(json)).toList();
    } else {
      throw ServerException('Bad Status Code');
    }
  }
}