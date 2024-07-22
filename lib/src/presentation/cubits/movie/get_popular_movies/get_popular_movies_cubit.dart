import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit() : super(GetPopularMoviesInitial());
}
