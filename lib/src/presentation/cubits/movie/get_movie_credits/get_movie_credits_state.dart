part of 'get_movie_credits_cubit.dart';

sealed class GetMovieCreditsState extends Equatable {
  const GetMovieCreditsState();

  @override
  List<Object> get props => [];
}

final class GetMovieCreditsInitial extends GetMovieCreditsState {}
