import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:cats_app/features/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CatsRepository {
  Future<Either<Failure,List<Cat>>> getCats();
}