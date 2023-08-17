import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/alert_dialog_widget.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';
import 'package:movie_app/features/list/presentation/pages/detail_favorite_list_screen.dart';

class FavoriteListBuilderWidget extends StatelessWidget {
  const FavoriteListBuilderWidget({
    super.key,
    required this.favoriteContent,
  });

  final FavoriteListEntity favoriteContent;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      itemCount: favoriteContent.listContent.length,
      itemBuilder: (context, index) {
        final contents = favoriteContent.listContent[index];
        return Dismissible(
          key: ValueKey(contents.uuid),
          confirmDismiss: (direction) {
            return confirmDismissAlert(context);
          },
          background: Container(
            color: Colors.red,
            margin: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
          ),
          onDismissed: (direction) {
            context
                .read<FavoriteListBloc>()
                .add(DeleteListEvent(contents.uuid));
          },
          child: Container(
            color: const Color(0xFF0A203B),
            margin: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            child: ListTile(
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return BlocProvider.value(
                        value: BlocProvider.of<FavoriteListBloc>(context),
                        child: DetailFavoriteListScreen(
                          contents: contents,
                          title: contents.listTitle,
                        ),
                      );
                    },
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF36B0E5),
                child: Text(
                  contents.listTitle[0].toUpperCase(),
                  style: const TextStyle(color: Color(0xFF020F1F)),
                ),
              ),
              title: Text(
                contents.listTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "${contents.totalMovies} filme(s) e ${contents.totalTvShows} série(s)",
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<bool?> confirmDismissAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialogWidget(
        title: "Excluir",
        description: "Tem certeza que deseja excluir o item?",
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text(
              "Excluir",
              style: TextStyle(
                color: Color(0xFFDA6363),
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      );
    },
  );
}
