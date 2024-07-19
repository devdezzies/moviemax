import 'package:fpdart/fpdart.dart';
import 'package:moviemax/src/core/exceptions/database/database_exception.dart';
import 'package:moviemax/src/core/exceptions/network/network_exception.dart';
import 'package:moviemax/src/domain/entities/movie_credit/movie_credit_entity.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:moviemax/src/domain/entities/movie_listings/movie_listings_entity.dart';

abstract class MovieRepository {
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({required int page});

  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page});

  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits({required int movieId});

  Future<Either<DatabaseException, MovieDetailEntity>> getSavedMovieDetails({required int movieId});

  Future<Either<DatabaseException, void>> saveMovieDetails({required MovieDetailEntity? movieDetailEntity});

  Future<Either<DatabaseException, void>> deleteMovieDetails({required int? movieId});

  Future<Either<DatabaseException, bool>> isSavedMovieDetail({required int? movieId});
}