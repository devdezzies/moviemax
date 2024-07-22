import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_actor_detail_state.dart';

class GetActorDetailCubit extends Cubit<GetActorDetailState> {
  GetActorDetailCubit() : super(GetActorDetailInitial());
}
