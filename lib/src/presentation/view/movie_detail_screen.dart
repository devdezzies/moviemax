import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviemax/src/core/constants/image_url_constants.dart';
import 'package:moviemax/src/core/extension/genre_id_extension.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';

@RoutePage()
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen(
      {super.key, required this.heroTag, required MovieDetailEntity movie})
      : _movie = movie;

  final Object heroTag;
  final MovieDetailEntity? _movie;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 15),
                child: InputChip(
                    showCheckmark: true,
                    side: const BorderSide(width: 0),
                    selected: true,
                    selectedColor: Colors.transparent,
                    label: Text(
                      "saved",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 13.sp),
                    )))
          ],
          leading: GestureDetector(
              onTap: () {
                context.router.maybePop();
              },
              child: const Icon(Icons.close_rounded)),
        ),
        body: ListView(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _movie?.title ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      ((_movie?.releaseDate ?? '').split("-").toList()[0]) +
                          " • " +
                          "${_movie?.originalLanguage ?? ''}",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                )),
            Container(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 16 / 9.5,
                child: Stack(children: [
                  CachedNetworkImage(
                      imageUrl:
                          '${ImageUrlConstants.originalImage(_movie?.backdropPath)}'),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(167, 0, 0, 0),
                            Color.fromARGB(164, 0, 0, 0),
                            Colors.black,
                          ]),
                    ),
                  )
                ]),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 180,
                    child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: CachedNetworkImage(
                            imageUrl:
                                '${ImageUrlConstants.originalImage(_movie?.posterPath)}')),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          _movie?.overview ?? '',
                          maxLines: 7,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(
                  right: 15, left: 15, top: 15, bottom: 10),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _movie?.genreIds?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Chip(
                        label: Text(
                          _movie?.genreIds?[index].getGenreFromNumber() ?? '',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        side: BorderSide.none,
                        backgroundColor:
                            const Color.fromARGB(29, 158, 158, 158),
                      ));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration:
                const BoxDecoration(border: Border(top: BorderSide(width: 1, color: Color.fromARGB(66, 158, 158, 158)), bottom: BorderSide(width: 1, color: Color.fromARGB(66, 158, 158, 158)))),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_outline_rounded,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          Text((_movie?.voteAverage.toString() ?? ''))
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                          Text("Rate This")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.how_to_vote_outlined,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          Text(_movie?.voteCount.toString() ?? '')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
