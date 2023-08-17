import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';
import 'package:movie_app/features/list/presentation/widgets/detail_favorite_item_list_builder.dart';
import 'package:movie_app/features/list/presentation/widgets/edit_list_name.dart';

class DetailFavoriteListScreen extends StatelessWidget {
  final FavoriteListItemEntity contents;
  final String title;
  const DetailFavoriteListScreen({
    required this.contents,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<FavoriteListBloc, FavoriteListState>(
          builder: (context, state) {
            if (state is UpdateCurrentList) {
              return Text(state.contentEntity.listContent.first.listTitle);
            }
            return Text(title);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await showModalBottomSheet<bool>(
                context: context,
                isScrollControlled: true,
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<FavoriteListBloc>(context),
                  child: EditListName(contents.uuid),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: DetailFavoriteListItemBuilder(contents),
    );
  }
}
