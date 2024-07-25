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
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined), label: 'explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: 'bookmark')
            ],
          ),
        );
      },
    );
  }
}
