import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviemax/src/data/datasources/_mappers/entity_converter.dart';
import 'package:moviemax/src/domain/entities/movie_credit/movie_credit_entity.dart';

import 'cast_model.dart';
import 'crew_model.dart';

part 'movie_credit_model.g.dart';

@JsonSerializable()
class MovieCreditModel extends Equatable
    with EntityConverter<MovieCreditModel, MovieCreditEntity> {
  final int? id;
  final List<CastModel>? cast;
  final List<CrewModel>? crew;

  const MovieCreditModel({this.id, this.cast, this.crew});

  factory MovieCreditModel.fromJson(Map<String, dynamic> json) {
    return _$MovieCreditModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieCreditModelToJson(this);

  @override
  List<Object?> get props => [id, cast, crew];

  @override
  MovieCreditEntity toEntity() {
    return MovieCreditEntity(
      id: id,
      cast: cast?.map((e) => e.toEntity()).toList(),
      crew: crew?.map((e) => e.toEntity()).toList(),
    );
  }
}
