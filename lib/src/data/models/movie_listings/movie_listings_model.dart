import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviemax/src/data/datasources/_mappers/entity_converter.dart';
import 'package:moviemax/src/data/models/movie_detail/movie_detail_model.dart';
import 'package:moviemax/src/domain/entities/movie_listings/movie_listings_entity.dart';

part 'movie_listings_model.g.dart';

@JsonSerializable()
class MovieListingsModel extends Equatable
    with EntityConverter<MovieListingsModel, MovieListingsEntity> {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "results")
  final List<MovieDetailModel>? movies;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "total_results")
  final int? totalResults;

  const MovieListingsModel(
      {required this.page,
      required this.movies,
      required this.totalPages,
      required this.totalResults});

  factory MovieListingsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListingsModelToJson(this);

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];

  @override
  MovieListingsEntity toEntity() {
    return MovieListingsEntity(
        page: page,
        movies: movies?.map((e) => e.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults);
  }
}
