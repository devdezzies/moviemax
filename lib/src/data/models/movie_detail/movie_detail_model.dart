import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviemax/src/data/datasources/_mappers/entity_converter.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel extends Equatable
    with EntityConverter<MovieDetailModel, MovieDetailEntity> {
  final String? title;
  final bool? video;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "adult")
  final bool? adult;

  const MovieDetailModel(
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

// Map<String, dynamic> == JSON
// MovieDetailModel == Dart Object

  // JSON deserialization
  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  // JSON serialization
  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);

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
}
