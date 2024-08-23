part of 'cats_bloc.dart';

abstract class CatsEvent extends Equatable {
  const CatsEvent();
}

class GetCatsEvent extends CatsEvent {
  @override
  List<Object?> get props => [];
}

class SearchCatsEvent extends CatsEvent {
  final String query;

  const SearchCatsEvent(this.query);

  @override
  List<Object> get props => [query];
}