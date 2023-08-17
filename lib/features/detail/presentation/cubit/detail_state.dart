part of 'detail_cubit.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final Content contentDetail;

  const DetailLoaded(this.contentDetail);

  @override
  List<Object> get props => [contentDetail];
}

class DetailFailure extends DetailState {
  final Failure failure;

  const DetailFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
