part of 'tvshows_cubit.dart';

sealed class TvshowsState extends Equatable {
  const TvshowsState();

  @override
  List<Object> get props => [];
}

final class TvshowsInitial extends TvshowsState {}

class TvshowsLoading extends TvshowsState {}

class TvshowsLoaded extends TvshowsState {
  final List<TVShowsEntity> tvshows;

  const TvshowsLoaded(this.tvshows);

  @override
  List<Object> get props => [tvshows];
}

class TVShowFailure extends TvshowsState {
  final Failure failure;

  const TVShowFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
