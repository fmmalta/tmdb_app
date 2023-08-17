import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/content/presentation/widgets/content_list_tile.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/presentation/pages/detail_screen.dart';

class ContentViewBuilder extends StatelessWidget {
  final List<Content> contents;
  const ContentViewBuilder(this.contents, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.h, bottom: 25.h),
      itemCount: contents.length,
      itemBuilder: (context, index) {
        final content = contents[index];
        return ContentListTile(
          content: content,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(content: content),
              ),
            );
          },
        );
      },
    );
  }
}
