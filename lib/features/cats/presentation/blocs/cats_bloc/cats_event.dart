part of 'cats_bloc.dart';

abstract class CatsEvent extends Equatable {
  const CatsEvent();
}

class GetCatsEvent extends CatsEvent{

  @override
  List<Object?> get props => [];
}