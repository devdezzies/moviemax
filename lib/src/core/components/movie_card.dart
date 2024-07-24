import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviemax/src/core/constants/image_url_constants.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movieDetailEntity});

  final MovieDetailEntity? movieDetailEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            placeholder: (context, text) {
              return const ColoredBox(color: Colors.amber);
            },
            imageUrl: '${ImageUrlConstants.originalImage(movieDetailEntity?.posterPath)}', fit: BoxFit.cover,),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movieDetailEntity?.originalTitle ?? '', style: Theme.of(context).textTheme.labelLarge, maxLines: 1,),
                Text("Crime", style: Theme.of(context).textTheme.labelMedium),
              ],
            ))
        ],
      ),
    );
  }
}
