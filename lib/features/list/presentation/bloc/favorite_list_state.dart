part of 'favorite_list_bloc.dart';

sealed class FavoriteListState extends Equatable {
  const FavoriteListState();

  @override
  List<Object> get props => [];
}

final class FavoriteListInitial extends FavoriteListState {}

final class FavoriteListLoading extends FavoriteListState {}

final class FavoriteListLoaded extends FavoriteListState {
  final FavoriteListEntity contentEntity;

  const FavoriteListLoaded(this.contentEntity);

  @override
  List<Object> get props => [contentEntity];
}

final class FavoriteListError extends FavoriteListState {}

final class FavoriteListEditedState extends FavoriteListState {
  final String newTitle;

  const FavoriteListEditedState(this.newTitle);

  @override
  List<Object> get props => [newTitle];
}

final class UpdateCurrentList extends FavoriteListState {
  final FavoriteListEntity contentEntity;

  const UpdateCurrentList(this.contentEntity);

  @override
  List<Object> get props => [contentEntity];
}
