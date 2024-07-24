part of 'get_popular_movies_cubit.dart';

sealed class GetPopularMoviesState extends Equatable {
  const GetPopularMoviesState();

  @override
  List<Object> get props => [];
}

final class GetPopularMoviesInitial extends GetPopularMoviesState {}

final class GetPopularMoviesLoading extends GetPopularMoviesState {}

final class GetPopularMoviesFailed extends GetPopularMoviesState {
  final String message;

  const GetPopularMoviesFailed({required this.message}); 

  @override
  List<Object> get props => [message];
}

final class GetPopularMoviesLoaded extends GetPopularMoviesState {
  final List<MovieDetailEntity> movies;

  const GetPopularMoviesLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}