import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';

class ContentListTile extends StatelessWidget {
  final void Function() onTap;
  final Content content;
  const ContentListTile({
    super.key,
    required this.onTap,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFF0A203B),
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Hero(
                tag: content.id,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 92.h,
                  width: 100.w,
                  imageUrl: content.posterUrl,
                  placeholder: (_, __) => const Center(
                      child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  )),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content.label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    content.type == ContentType.movie
                        ? 'Exibido em ${content.date}'
                        : 'Estreado em ${content.date}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
