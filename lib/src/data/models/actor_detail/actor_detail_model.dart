import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviemax/src/data/datasources/_mappers/entity_converter.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';

part 'actor_detail_model.g.dart';

@JsonSerializable()
class ActorDetailModel extends Equatable
    with EntityConverter<ActorDetailModel, ActorDetailEntity> {
  final bool? adult;
  @JsonKey(name: 'also_known_as')
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final int? gender;
  final String? homepage;
  final int? id;
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  const ActorDetailModel({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  factory ActorDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActorDetailModelToJson(this);

  @override
  List<Object?> get props {
    return [
      adult,
      alsoKnownAs,
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath,
    ];
  }

  @override
  ActorDetailEntity toEntity() {
    return ActorDetailEntity(
      adult: adult,
      alsoKnownAs: alsoKnownAs,
      biography: biography,
      birthday: birthday,
      deathday: deathday,
      gender: gender,
      homepage: homepage,
      id: id,
      imdbId: imdbId,
      knownForDepartment: knownForDepartment,
      name: name,
      placeOfBirth: placeOfBirth,
      popularity: popularity,
      profilePath: profilePath,
    );
  }
}
