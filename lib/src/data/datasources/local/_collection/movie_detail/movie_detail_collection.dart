import 'package:isar/isar.dart';
import 'package:moviemax/src/data/datasources/_mappers/entity_converter.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';

part 'movie_detail_collection.g.dart';

@collection
class MovieDetailCollection
    with EntityConverter<MovieDetailCollection, MovieDetailEntity> {
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
  final Id? id;
  final List<int>? genreIds;
  final String? backdropPath;
  final bool? adult;

  MovieDetailCollection({
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
        title: title,
        video: video,
        posterPath: posterPath,
        popularity: popularity,
        releaseDate: releaseDate,
        voteAverage: voteAverage,
        voteCount: voteCount,
        overview: overview,
        originalTitle: originalTitle,
        originalLanguage: originalLanguage,
        id: id,
        genreIds: genreIds,
        backdropPath: backdropPath,
        adult: adult);
  }

  @override
  MovieDetailCollection fromEntity(MovieDetailEntity? entity) {
    return MovieDetailCollection(
        title: entity?.title,
        video: entity?.video,
        posterPath: entity?.posterPath,
        popularity: entity?.popularity,
        releaseDate: entity?.releaseDate,
        voteAverage: entity?.voteAverage,
        voteCount: entity?.voteCount,
        overview: entity?.overview,
        originalTitle: entity?.originalTitle,
        originalLanguage: entity?.originalLanguage,
        id: entity?.id,
        genreIds: entity?.genreIds,
        backdropPath: entity?.backdropPath,
        adult: entity?.adult);
  }
}
