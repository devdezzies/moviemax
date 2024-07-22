import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_movie_credits_state.dart';

class GetMovieCreditsCubit extends Cubit<GetMovieCreditsState> {
  GetMovieCreditsCubit() : super(GetMovieCreditsInitial());
}
