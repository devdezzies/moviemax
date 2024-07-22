import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_saved_movie_details_state.dart';

class GetSavedMovieDetailsCubit extends Cubit<GetSavedMovieDetailsState> {
  GetSavedMovieDetailsCubit() : super(GetSavedMovieDetailsInitial());
}
