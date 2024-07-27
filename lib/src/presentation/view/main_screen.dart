import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviemax/src/config/router/app_router.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: true,
      lazyLoad: false,
      animationDuration: const Duration(milliseconds: 100),
      navigatorObservers: () => [HeroController()],
      routes: const [
        HomeRoute(),
        ExploreRoute(),
        BookmarkRoute(),
        PopularMoviesRoute()
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: BottomNavigationBar(
            enableFeedback: false,
            currentIndex: tabsRouter.activeIndex > 2 ? 0 : tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie_creation_outlined),
                  label: 'Movie',
                  activeIcon: Icon(Icons.movie)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  label: 'explore',
                  activeIcon: Icon(Icons.explore_rounded)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border),
                  label: 'bookmark',
                  activeIcon: Icon(Icons.bookmark))
            ],
          ),
        );
      },
    );
  }
}
