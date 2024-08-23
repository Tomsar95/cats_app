import 'package:cats_app/features/cats/data/datasources/cats_remote_data_source.dart';
import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:cats_app/features/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/repositories/cats_repository.dart';

class CatsRepositoryImpl implements CatsRepository {

  final CatsRemoteDataSource remoteDataSource;

  CatsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Cat>>> getCats() async {
    try {
      final catsList = await remoteDataSource.getCats();
      return Right(catsList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}