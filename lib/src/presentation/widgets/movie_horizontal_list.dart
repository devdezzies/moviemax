import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviemax/src/config/router/app_router.dart';
import 'package:moviemax/src/core/components/movie_card.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({super.key, this.movies});

  final List<MovieDetailEntity>? movies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 250,
        //decoration: BoxDecoration(color: Colors.green),
        child: Container(
          //decoration: BoxDecoration(color: Colors.amber),
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            children: List.generate(
              10,
              (index) {
                final tag = UniqueKey();
                return GestureDetector(
                  onTap: () {
                    context.router.push(MovieDetailRoute(heroTag: tag, movie: movies![index]));
                  },
                  child: Hero(
                    tag: tag,
                    child: MovieCard(
                      movieDetailEntity: movies?[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
