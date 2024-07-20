// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    MovieDetailModel(
      title: json['title'] as String?,
      video: json['video'] as bool?,
      posterPath: json['poster_path'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      overview: json['overview'] as String?,
      originalTitle: json['original_title'] as String?,
      originalLanguage: json['original_language'] as String?,
      id: (json['id'] as num?)?.toInt(),
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      backdropPath: json['backdrop_path'] as String?,
      adult: json['adult'] as bool?,
    );

Map<String, dynamic> _$MovieDetailModelToJson(MovieDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'video': instance.video,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'overview': instance.overview,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'id': instance.id,
      'genre_ids': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
    };
