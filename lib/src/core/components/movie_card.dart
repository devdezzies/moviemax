import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviemax/src/core/constants/image_url_constants.dart';
import 'package:moviemax/src/domain/entities/export_entities.dart';
import 'package:moviemax/src/domain/entities/movie_detail/movie_detail_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movieDetailEntity});

  final MovieDetailEntity? movieDetailEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Card(
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
        child: AspectRatio(
          aspectRatio: 2/3,
          child: CachedNetworkImage(
            // placeholder: (context, text) {
            //   return Image.network("https://images.unsplash.com/photo-1721714874858-18526c08b8d7?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
            // },
            //progressIndicatorBuilder:(context, url, progress) => const Center(child: CircularProgressIndicator(),),
            imageUrl:
                '${ImageUrlConstants.originalImage(movieDetailEntity?.posterPath)}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
