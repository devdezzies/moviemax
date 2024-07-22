import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_top_rated_movies_state.dart';

class GetTopRatedMoviesCubit extends Cubit<GetTopRatedMoviesState> {
  GetTopRatedMoviesCubit() : super(GetTopRatedMoviesInitial());
}
