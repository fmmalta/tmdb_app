import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/alert_widget.dart';
import 'package:movie_app/features/detail/presentation/widgets/add_content_to_list.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';
import 'package:movie_app/features/list/presentation/widgets/favorite_list_builder_widget.dart';

class FavoriteListTabView extends StatelessWidget {
  FavoriteListTabView({super.key});

  final FavoriteListEntity favoriteListEntity = FavoriteListEntity(
    listContent: [],
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteListBloc>(
      create: (context) => FavoriteListBloc()..add(GetListsEvent()),
      child: Scaffold(
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (_) => BlocProvider<FavoriteListBloc>.value(
                  value: BlocProvider.of<FavoriteListBloc>(context),
                  child: const AddContentToList(),
                ),
              );
            },
            child: const Icon(Icons.add, color: Color(0xFF020F1F)),
          );
        }),
        body: BlocConsumer<FavoriteListBloc, FavoriteListState>(
          listener: (context, state) {
            if (state is FavoriteListLoaded) {
              favoriteListEntity.listContent = state.contentEntity.listContent;
            } else if (state is UpdateCurrentList) {
              favoriteListEntity.listContent = state.contentEntity.listContent;
            }
          },
          builder: (context, state) {
            if (state is FavoriteListLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              final content = favoriteListEntity;
              if (content.listContent.isEmpty) {
                return const AlertWidget(
                  iconPath: 'assets/emptyListIcon.svg',
                  description:
                      "Você ainda não possui nenhuma lista. Toque no botão + para adicionar uma nova.",
                );
              }
              return FavoriteListBuilderWidget(favoriteContent: content);
            }
          },
        ),
      ),
    );
  }
}
