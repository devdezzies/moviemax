import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final String? title;
  final bool? video;
  final String? posterPath;
  final double? popularity;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final String? overview;
  final String? originalTitle;
  final String? originalLanguage;
  final int? id;
  final List<int>? genreIds;
  final String? backdropPath;
  final bool? adult;

  const MovieDetailEntity(
      {this.title,
      this.video,
      this.posterPath,
      this.popularity,
      this.releaseDate,
      this.voteAverage,
      this.voteCount,
      this.overview,
      this.originalTitle,
      this.originalLanguage,
      this.id,
      this.genreIds,
      this.backdropPath,
      this.adult});

  @override
  List<Object?> get props => [
        title,
        video,
        posterPath,
        popularity,
        releaseDate,
        voteAverage,
        voteCount,
        overview,
        originalTitle,
        originalLanguage,
        id,
        genreIds,
        backdropPath,
        adult
      ];
}
