import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';

class SeasonsListWidget extends StatelessWidget {
  final List<Season> seasons;

  const SeasonsListWidget(this.seasons, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: seasons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final season = seasons[index];
          return SizedBox(
            width: 177.w,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 102.h,
                  child: CachedNetworkImage(
                    imageUrl: BASE_IMAGE_URL + season.posterPath!,
                    placeholder: (_, __) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (_, __, ___) =>
                        const Icon(Icons.error, color: Colors.white),
                  ),
                ),
                SizedBox(width: 9.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Temporada ${season.seasonNumber}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      season.airDate == null
                          ? ""
                          : season.airDate!.year.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF0B2342),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 18),
                          SizedBox(width: 5.w),
                          Text(
                            season.voteAverage.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
