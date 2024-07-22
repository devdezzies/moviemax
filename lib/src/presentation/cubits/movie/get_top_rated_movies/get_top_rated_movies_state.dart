part of 'get_top_rated_movies_cubit.dart';

sealed class GetTopRatedMoviesState extends Equatable {
  const GetTopRatedMoviesState();

  @override
  List<Object> get props => [];
}

final class GetTopRatedMoviesInitial extends GetTopRatedMoviesState {}
