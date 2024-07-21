import 'package:isar/isar.dart';
import 'package:moviemax/src/core/database/local_database.dart';
import 'package:moviemax/src/data/datasources/local/_collection/movie_detail/movie_detail_collection.dart';
import 'package:moviemax/src/data/datasources/local/movie/movie_local_data_source.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final LocalDatabase localDatabase;

  const MovieLocalDataSourceImpl(this.localDatabase);

  @override
  Future<void> deleteMovieDetail({required int? movieId}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async {
        db.movieDetailCollections.filter().idEqualTo(movieId).deleteAll();
      });
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<MovieDetailCollection>> getSavedMovieDetail() async {
    try {
      final result =
          await localDatabase.db.movieDetailCollections.where().findAll();
      return result;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> isSavedMovieDetail({required int? movieId}) async {
    try {
      final isSaved = await localDatabase.db.movieDetailCollections
          .filter()
          .idEqualTo(movieId)
          .isNotEmpty();
      return isSaved;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveMovieDetail(
      {required MovieDetailCollection movieDetailCollection}) async {
    try {
      final db = localDatabase.db;
      await db.writeTxn(() async {
        db.movieDetailCollections.put(movieDetailCollection);
      });
    } catch (_) {
      rethrow;
    }
  }
}
