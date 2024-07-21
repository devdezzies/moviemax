import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:isar/isar.dart';
import 'package:moviemax/src/core/exceptions/database/database_exception.dart';
import 'package:moviemax/src/core/exceptions/network/network_exception.dart';
import 'package:moviemax/src/data/datasources/local/_collection/movie_detail/movie_detail_collection.dart';
import 'package:moviemax/src/data/datasources/local/movie/movie_local_data_source.dart';
import 'package:moviemax/src/data/datasources/remote/movie/movie_remote_data_source.dart';
import 'package:moviemax/src/domain/entities/movie_credit/movie_credit_entity.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:moviemax/src/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:moviemax/src/domain/repositories/movie/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  const MovieRepositoryImpl({required this.movieRemoteDataSource, required this.movieLocalDataSource});

  // REMOTE

  @override
  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits({required int movieId}) async {
    try {
      final result = await movieRemoteDataSource.getMovieCredits(movieId: movieId);
      return Right(result.toEntity());
    } on DioException catch(e) {
      throw Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({required int page}) async {
    try {
      final result = await movieRemoteDataSource.getPopularMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch (e) {
      throw Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({required int page}) async {
    try {
      final result = await movieRemoteDataSource.getTopRatedMovies(page: page);
      return Right(result.toEntity());
    } on DioException catch(e) {
      throw Left(NetworkException.fromDioError(e));
    }
  }

  // LOCAL

  @override
  Future<Either<DatabaseException, bool>> isSavedMovieDetail({required int? movieId}) async {
    try {
      final isSaved = await movieLocalDataSource.isSavedMovieDetail(movieId: movieId);
      return Right(isSaved);
    } on IsarError catch(e) {
      throw Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> saveMovieDetails({required MovieDetailEntity? movieDetailEntity}) async {
    try {
      final result = await movieLocalDataSource.saveMovieDetail(movieDetailCollection: MovieDetailCollection().fromEntity(movieDetailEntity));
      return Right(result);
    } on IsarError catch (e) {
      throw Left(DatabaseException.fromIsarError(e));
    }
  }
  
  @override
  Future<Either<DatabaseException, void>> deleteMovieDetails({required int? movieId}) async {
    try {
      final result = await movieLocalDataSource.deleteMovieDetail(movieId: movieId);
      return Right(result);
    } on IsarError catch(e) {
      throw Left(DatabaseException.fromIsarError(e));
    }
  }
  
  @override
  Future<Either<DatabaseException, List<MovieDetailEntity>>> getSavedMovieDetails() async {
    try {
      final list = await movieLocalDataSource.getSavedMovieDetail();
      return Right(list.map((e) => e.toEntity()).toList());
    } on IsarError catch (e) {
      throw Left(DatabaseException.fromIsarError(e));
    }
  }
  
}