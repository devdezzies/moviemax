import 'package:equatable/equatable.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';

class MovieListingsEntity extends Equatable {
  final int? page;
  final List<MovieDetailEntity>? movies;
  final int? totalPages;
  final int? totalResults;

  const MovieListingsEntity(
      {this.page, this.movies, this.totalPages, this.totalResults});

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];
}
