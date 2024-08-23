import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/cat.dart';
import '../repositories/cats_repository.dart';

class GetCats implements UseCase<List<Cat>, NoParams>{
  final CatsRepository repository;

  GetCats(this.repository);

  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) async {
    return await repository.getCats();
  }

}
