import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviemax/src/config/router/app_router.dart';
import 'package:moviemax/src/core/components/movie_card.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';

class MovieListings extends HookWidget {
  const MovieListings(
      {super.key,
      required this.movies,
      required this.whenScrollBottom,
      required this.hasReachedMax});

  final List<MovieDetailEntity>? movies;
  final void Function() whenScrollBottom;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    useAutomaticKeepAlive();

    final listener = useMemoized(
      () => () async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          whenScrollBottom.call();
        }
      },
    );
    useEffect(
      () {
        scrollController.addListener(listener);
        return () => scrollController.removeListener(listener);
      },
      [scrollController],
    );

    return ListView(
      shrinkWrap: true,
      controller: scrollController,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: movies?.length ?? 0,
          itemBuilder: (context, index) {
            final tag = UniqueKey();
            return GestureDetector(
                onTap: () {
                  context.router.push(const MovieDetailRoute());
                },
                child: Hero(
                    tag: tag,
                    child: MovieCard(
                      movieDetailEntity: movies?[index],
                    )));
          },
        ),
        if (!hasReachedMax)
          const Center(
            child: Text("Loading..."),
          )
      ],
    );
  }
}
