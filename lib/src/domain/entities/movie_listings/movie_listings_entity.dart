import 'package:equatable/equatable.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';

class MovieListingsEntity extends Equatable {
  final int? page;
  final List<MovieDetailEntity>? movies;
  final int? totalPages;
  final int? totalResults;

  const MovieListingsEntity(
      {required this.page,
      required this.movies,
      required this.totalPages,
      required this.totalResults});
      
    @override

    List<Object?> get props => [
      page, 
      movies, 
      totalPages, 
      totalResults
    ];
}
