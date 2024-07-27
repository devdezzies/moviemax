import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviemax/src/config/router/app_router.dart';
import 'package:moviemax/src/presentation/cubits/movie/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:moviemax/src/presentation/widgets/movie_listings.dart';

@RoutePage()
class PopularMoviesView extends HookWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
      builder: (context, state) {
        if (state is GetPopularMoviesFailed) {
          return const Text("error");
        }
        if (state is! GetPopularMoviesLoaded) {
          return const CircularProgressIndicator();
        }
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  context.router.navigate(const HomeRoute());
                },
                child: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: MovieListings(
                movies: state.movies,
                whenScrollBottom: () async {
                  context.read<GetPopularMoviesCubit>().getPopularMovies();
                },
                hasReachedMax:
                    context.watch<GetPopularMoviesCubit>().hasReachedMax,
              )),
        );
      },
    );
  }
}
