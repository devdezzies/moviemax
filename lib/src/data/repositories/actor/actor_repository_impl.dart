import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:moviemax/src/core/exceptions/network/network_exception.dart';
import 'package:moviemax/src/data/datasources/remote/actor/actor_remote_data_source.dart';
import 'package:moviemax/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:moviemax/src/domain/entities/actor_social_media/actor_social_media_entity.dart';
import 'package:moviemax/src/domain/repositories/actor/actor_repository.dart';

class ActorRepositoryImpl implements ActorRepository {
  final ActorRemoteDataSource actorRemoteDataSource;

  const ActorRepositoryImpl(this.actorRemoteDataSource);

  @override
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail(
      {required String actorId}) async {
    try {
      final result =
          await actorRemoteDataSource.getActorDetail(actorId: actorId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      throw Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia(
      {required String actorId}) async {
    try {
      final result =
          await actorRemoteDataSource.getActorSocialMedia(actorId: actorId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      throw Left(NetworkException.fromDioError(e));
    }
  }
}
