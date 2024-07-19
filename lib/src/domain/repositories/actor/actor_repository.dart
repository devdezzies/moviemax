import 'package:fpdart/fpdart.dart';
import 'package:moviemax/src/core/exceptions/network/network_exception.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';

abstract class ActorRepository {
  // the keeper will try to find the actor detail entity, if it succeeds he will give you the entity otherwise network exception
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required String actorId});

  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId});
}