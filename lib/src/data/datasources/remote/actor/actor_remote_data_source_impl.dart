import 'package:moviemax/src/core/constants/url_constants.dart';
import 'package:moviemax/src/core/network/dio_client.dart';
import 'package:moviemax/src/data/datasources/remote/actor/actor_remote_data_source.dart';
import 'package:moviemax/src/data/models/actor_detail/actor_detail_model.dart';
import 'package:moviemax/src/data/models/actor_social_media/actor_social_media_model.dart';

class ActorRemoteDataSourceImpl implements ActorRemoteDataSource {
  final DioClient _dioClient;

  const ActorRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ActorDetailModel> getActorDetail({required String actorId}) async {
    final response = await _dioClient.get(UrlConstants.actorDetail.replaceAll('{person_id}', actorId));
    final model = ActorDetailModel.fromJson(response.data as Map<String, dynamic>);
    return model;
  }

  @override
  Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId}) async {
    final response = await _dioClient.get(UrlConstants.actorSocialMedia.replaceAll('{person_id}', actorId));
    final model = ActorSocialMediaModel.fromJson(response.data as Map<String, dynamic>);
    return model;
  }
  
}