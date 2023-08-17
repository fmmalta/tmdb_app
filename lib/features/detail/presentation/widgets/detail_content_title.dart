import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';

class DetailContentTile extends StatelessWidget {
  final Content content;
  const DetailContentTile({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: content.id,
            child: CachedNetworkImage(
              imageUrl: content.posterUrl,
              placeholder: (_, __) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: 9.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${content.label} (${content.year})",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  content.type == ContentType.movie
                      ? content.date
                      : "${content.seasons.length} temporada(s)",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  content.genres.map((genre) => genre.name).toList().join(", "),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                content.type == ContentType.tv
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content.createdBy
                                .map((createdBy) => createdBy.name)
                                .toList()
                                .join(", "),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          content.createdBy.isEmpty
                              ? const SizedBox()
                              : Text(
                                  "Diretor",
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
