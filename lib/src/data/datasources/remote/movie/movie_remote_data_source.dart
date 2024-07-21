import 'package:moviemax/src/data/models/movie_credit/movie_credit_model.dart';
import 'package:moviemax/src/data/models/movie_listings/movie_listings_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieListingsModel> getTopRatedMovies({required int page});

  Future<MovieListingsModel> getPopularMovies({required int page});

  Future<MovieCreditModel> getMovieCredits({required int movieId});
}