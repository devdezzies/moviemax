import 'package:moviemax/src/data/datasources/local/_collection/movie_detail/movie_detail_collection.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovieDetail({required MovieDetailCollection movieDetailCollection});

  Future<void> deleteMovieDetail({required int? movieId});

  Future<bool> isSavedMovieDetail({required int? movieId});

  Future<List<MovieDetailCollection>> getSavedMovieDetail();
}