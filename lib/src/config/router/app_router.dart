import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviemax/src/core/constants/path_constants.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';
import 'package:moviemax/src/presentation/view/bookmark_screen.dart';
import 'package:moviemax/src/presentation/view/explore_screen.dart';
import 'package:moviemax/src/presentation/view/home_screen.dart';
import 'package:moviemax/src/presentation/view/main_screen.dart';
import 'package:moviemax/src/presentation/view/movie_detail_screen.dart';
import 'package:moviemax/src/presentation/view/popular_movies_screen.dart';
//import 'package:moviemax/src/presentation/view/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AdaptiveRoute(
          page: MainRoute.page,
          path: PathConstants.main,
          initial: true,
          children: [
            AdaptiveRoute(
                page: HomeRoute.page,
                path: PathConstants.home,
                title: (__, _) => 'Home'),
            AdaptiveRoute(
              page: ExploreRoute.page,
              path: PathConstants.explore,
              title: (__, _) => 'Explore',
            ),
            AdaptiveRoute(
                page: BookmarkRoute.page,
                path: PathConstants.bookmark,
                title: (__, _) => 'Bookmarks'),
            AdaptiveRoute(
              page: PopularMoviesRoute.page,
              path: PathConstants.popularMoviesView,
            )
          ],
        ),
        CustomRoute(
            page: MovieDetailRoute.page,
            path: PathConstants.movieDetail,
            durationInMilliseconds: 600,
            reverseDurationInMilliseconds: 600,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                //filterQuality: FilterQuality.high,
                scale: animation,
                child: child,
              );
            }),
      ];
}
