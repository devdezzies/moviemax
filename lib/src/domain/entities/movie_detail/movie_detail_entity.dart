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
      {required this.title,
      required this.video,
      required this.posterPath,
      required this.popularity,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount,
      required this.overview,
      required this.originalTitle,
      required this.originalLanguage,
      required this.id,
      required this.genreIds,
      required this.backdropPath,
      required this.adult});

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
