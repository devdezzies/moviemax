import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moviemax/src/config/router/app_router.dart';
import 'package:moviemax/src/presentation/cubits/movie/get_popular_movies/get_popular_movies_cubit.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<GetPopularMoviesCubit>()..getPopularMovies()),
      ],
      child: AutoTabsScaffold(
        resizeToAvoidBottomInset: true,
        lazyLoad: false,
        animationDuration: const Duration(milliseconds: 100),
        navigatorObservers: () => [HeroController()],
        appBarBuilder: (context, tabsRouter) {
          return AppBar(
            title: Text(tabsRouter.current.title.call(context)),
          );
        },
        routes: const [
          HomeRoute(),
          ExploreRoute(),
          BookmarkRoute()
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: BottomNavigationBar(
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
                BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'explore'),
                BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'bookmark')
              ],
            ),
          );
        },
      ),
    );
  }
}
