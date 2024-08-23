import 'package:cats_app/features/cats/domain/use_cases/get_cats.dart';
import 'package:equatable/equatable.dart';
import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/usecases/usecase.dart';

part 'cats_event.dart';

part 'cats_state.dart';

class CatsBloc
    extends Bloc<CatsEvent, CatsState> {
  final GetCats getCats;

  CatsBloc({required this.getCats})
      : super(const CatsInitial(isLoading: true)) {
    on<CatsEvent>((event, emit) async {
      if (event is GetCatsEvent) {
        emit(const CatsInitial(isLoading: true));
        final episodesOrFailure = await getCats(NoParams());
        await episodesOrFailure.fold((failure) {
          emit(const ErrorState(
              message: 'Ops,an error occurred loading your data'));
        }, (series) async {
          emit(LoadedCatsState(listOfCats: series));
        });
      }
    });
  }
}