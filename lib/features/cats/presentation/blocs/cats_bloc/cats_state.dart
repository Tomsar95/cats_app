part of 'cats_bloc.dart';

abstract class CatsState extends Equatable {
  const CatsState();
}

class CatsInitial extends CatsState {
  final bool isLoading;

  const CatsInitial({required this.isLoading});

  @override
  List<Object> get props => [];
}

class LoadedCatsState extends CatsState {

  final List<Cat> listOfCats;

  const LoadedCatsState({required this.listOfCats});

  @override
  List<Object> get props => [];
}

class EmptyState extends CatsState {
  @override
  List<Object> get props => [];
}

class ErrorState extends CatsState {

  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [];
}