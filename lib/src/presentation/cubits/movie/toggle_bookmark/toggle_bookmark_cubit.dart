import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_bookmark_state.dart';

class ToggleBookmarkCubit extends Cubit<ToggleBookmarkState> {
  ToggleBookmarkCubit() : super(ToggleBookmarkInitial());
}
