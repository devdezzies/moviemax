import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_actor_social_media_state.dart';

class GetActorSocialMediaCubit extends Cubit<GetActorSocialMediaState> {
  GetActorSocialMediaCubit() : super(GetActorSocialMediaInitial());
}
