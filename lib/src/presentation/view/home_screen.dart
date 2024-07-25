import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemax/src/config/router/app_router.dart';
import 'package:moviemax/src/core/components/home_screen_title_section.dart';
import 'package:moviemax/src/core/constants/path_constants.dart';
import 'package:moviemax/src/presentation/cubits/movie/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:moviemax/src/presentation/widgets/movie_horizontal_list.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
          builder: (context, state) {
            if (state is GetPopularMoviesFailed) {
              return const Text("error");
            }
            if (state is! GetPopularMoviesLoaded) {
              return const Text("loading..");
            }
            return Column(
              children: [
                HomeScreenTitleSection(
                  headerTitle: "#10 Most Popular Today",
                  onTapCallBack: () {
                    context.router.navigate(const PopularMoviesRoute());
                  },
                ),
                MovieHorizontalList(
                  movies: state.movies,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
