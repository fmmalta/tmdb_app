import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/core/widgets/alert_widget.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';
import 'package:movie_app/features/list/presentation/widgets/favorite_list_builder_widget.dart';

class DetailFavoriteListItemBuilder extends StatelessWidget {
  final FavoriteListItemEntity favoriteContent;
  const DetailFavoriteListItemBuilder(this.favoriteContent, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteContent.content.isEmpty) {
      return const AlertWidget(
          iconPath: 'assets/emptyListIcon.svg',
          description: "Sua lista está vazia, adicione seus filmes e séries.");
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      itemCount: favoriteContent.content.length,
      itemBuilder: (context, index) {
        final content = favoriteContent.content.toList()[index];
        return Dismissible(
          key: Key(content.id.toString()),
          confirmDismiss: (direction) {
            return confirmDismissAlert(context);
          },
          onDismissed: (direction) {
            context.read<FavoriteListBloc>().add(
                  RemoveContentFromListEvent(
                    id: favoriteContent.uuid,
                    content: content,
                  ),
                );
          },
          background: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            color: Colors.red,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          direction: DismissDirection.endToStart,
          child: Container(
            color: const Color(0xFF0A203B),
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: ListTile(
              leading: Hero(
                tag: content.id,
                child: IntrinsicWidth(
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: BASE_IMAGE_URL + content.posterPath,
                    placeholder: (_, __) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                  ),
                ),
              ),
              title: Text(
                content.label,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('Exibido em ${content.date}'),
            ),
          ),
        );
      },
    );
  }
}
