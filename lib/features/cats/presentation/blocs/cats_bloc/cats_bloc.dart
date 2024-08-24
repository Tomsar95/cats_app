import 'package:cats_app/features/cats/domain/use_cases/get_cats.dart';
import 'package:equatable/equatable.dart';
import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/utils.dart';

part 'cats_event.dart';

part 'cats_state.dart';

class CatsBloc
    extends Bloc<CatsEvent, CatsState> {
  final GetCats getCats;

  List<Cat> allCats = [];
  List<Cat> filteredCats = [];

  CatsBloc({required this.getCats})
      : super(const CatsInitial(isLoading: true)) {
    on<CatsEvent>((event, emit) async {
      if (event is GetCatsEvent) {
        emit(const CatsInitial(isLoading: true));
        final catsOrFailure = await getCats(NoParams());
        await catsOrFailure.fold((failure) {
          emit(const ErrorState(
              message: Utils.serverFailureMessage));
        }, (cats) async {
          allCats = cats;
          emit(LoadedCatsState(listOfCats: cats));
        });
      }
      if (event is SearchCatsEvent) {
        emit(const CatsInitial(isLoading: true));
        if (event.query.isEmpty) {
          emit(LoadedCatsState(listOfCats: allCats));
        } else {
          filteredCats = allCats.where((cat) {
            final nameLower = cat.name.toLowerCase();
            final queryLower = event.query.toLowerCase();
            return nameLower.contains(queryLower);
          }).toList();
          emit(LoadedCatsState(listOfCats: filteredCats));
        }
      }
    });
  }
}