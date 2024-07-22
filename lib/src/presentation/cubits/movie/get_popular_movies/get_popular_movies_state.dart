part of 'get_popular_movies_cubit.dart';

sealed class GetPopularMoviesState extends Equatable {
  const GetPopularMoviesState();

  @override
  List<Object> get props => [];
}

final class GetPopularMoviesInitial extends GetPopularMoviesState {}
