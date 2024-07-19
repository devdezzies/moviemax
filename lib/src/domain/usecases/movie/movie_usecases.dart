import 'package:fpdart/fpdart.dart';
import 'package:moviemax/src/core/exceptions/database/database_exception.dart';
import 'package:moviemax/src/core/exceptions/network/network_exception.dart';
//import 'package:moviemax/src/domain/entities/export_entities.dart';
import 'package:moviemax/src/domain/entities/movie_credit/movie_credit_entity.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:moviemax/src/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:moviemax/src/domain/repositories/movie/movie_repository.dart';

class MovieUsecases {
  final MovieRepository _movieRepository;

  MovieUsecases({required MovieRepository movieRepository}) : _movieRepository = movieRepository; 

  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({required int page}) {
    return _movieRepository.getTopRatedMovies(page: page);
  }

  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page}) {
    return _movieRepository.getPopularMovies(page: page);
  }

  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits({required int movieId}) {
    return _movieRepository.getMovieCredits(movieId: movieId);
  }

  // LOCAL

  Future<Either<DatabaseException, MovieDetailEntity>> getSavedMovieDetails({required int movieId}) {
    return _movieRepository.getSavedMovieDetails(movieId: movieId);
  }

  Future<Either<DatabaseException, void>> toggleBookmark({required MovieDetailEntity? movieDetailEntity}) async {
    final isSaved = await _movieRepository.isSavedMovieDetail(movieId: movieDetailEntity?.id);

    return isSaved.fold((error) {
      return Left(error);
    }, (isSaved) {
      if (isSaved) {
        return _movieRepository.deleteMovieDetails(movieId: movieDetailEntity?.id);
      } else {
        return _movieRepository.saveMovieDetails(movieDetailEntity: movieDetailEntity);
      }
    });
  }
}