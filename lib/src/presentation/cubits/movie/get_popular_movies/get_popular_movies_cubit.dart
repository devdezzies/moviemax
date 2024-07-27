import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';
import 'package:moviemax/src/domain/usecases/export_usecases.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this._movieUsecases) : super(GetPopularMoviesInitial());
  final MovieUsecases _movieUsecases;

  final List<MovieDetailEntity> _movieList = [];

  int _page = 1;
  bool hasReachedMax = false;

  Future<void> getPopularMovies() async {
    try {
      // Checks if the maximum limit has been reached.
      if (hasReachedMax) return;

      // it's important to preserve the screen state if the prev call was a success, make sure the next call doesn't hit this
      if (state is! GetPopularMoviesLoaded) {
        emit(GetPopularMoviesLoading());
      }

      final result = await _movieUsecases.getPopularMovies(page: _page);

      result.fold(
        (error) => emit(GetPopularMoviesFailed(message: error.message)),
        (success) {
          _page++;
          _movieList.addAll(success.movies?.where((movie) => _movieList.contains(movie) == false) ?? []);

          if ((success.movies?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(GetPopularMoviesLoaded(movies: List.of(_movieList), totalResults: success.totalResults ?? 0));
        },
      );
    } catch (_) {
      rethrow;
    }
  }
}
