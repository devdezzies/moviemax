import 'package:fpdart/fpdart.dart';
import 'package:moviemax/src/core/exceptions/network/network_exception.dart';
import 'package:moviemax/src/domain/entities/actor_detail/actor_detail_entity.dart';
import 'package:moviemax/src/domain/entities/actor_social_media/actor_social_media_entity.dart';
import 'package:moviemax/src/domain/repositories/actor/actor_repository.dart';

class ActorUsecases {
  final ActorRepository _actorRepository;

  ActorUsecases({required ActorRepository actorRepository}) : _actorRepository = actorRepository; 

  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({required String actorId}) {
    return _actorRepository.getActorDetail(actorId: actorId);
  }

  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId}) {
    return _actorRepository.getActorSocialMedia(actorId: actorId);
  }
}