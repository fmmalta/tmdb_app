import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';

class AddContentToListIfNotEmpty extends StatelessWidget {
  final Content? content;
  final void Function()? createListOnPressed;
  const AddContentToListIfNotEmpty({
    this.content,
    this.createListOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteListBloc, FavoriteListState>(
      builder: (context, state) {
        if (state is FavoriteListLoaded) {
          if (state.contentEntity.listContent.isNotEmpty) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Adicionar à lista",
                  style: TextStyle(fontSize: 22.sp, color: Colors.white),
                ),
                ListView.builder(
                  padding: EdgeInsets.only(top: 25.h),
                  shrinkWrap: true,
                  itemCount: state.contentEntity.listContent.length,
                  itemBuilder: (context, index) {
                    final item = state.contentEntity.listContent[index];
                    return Container(
                      color: const Color(0xFF0A203B),
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 2.h,
                      ),
                      child: ListTile(
                        onTap: () {
                          if (content != null) {
                            context.read<FavoriteListBloc>().add(
                                  AddContentToListEvent(
                                    id: item.uuid,
                                    content: content!,
                                  ),
                                );
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  '${content!.label} foi adicionado à lista'),
                            ));
                            Navigator.of(context).pop();
                          }
                        },
                        title: Text(item.listTitle),
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFF36B0E5),
                          child: Text(
                            item.listTitle[0].toUpperCase(),
                            style: const TextStyle(color: Color(0xFF020F1F)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.maxFinite,
                  child: OutlinedButton(
                    onPressed: createListOnPressed,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      foregroundColor: const Color(0xFF36B0E5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                    ),
                    child: const Text('+ Criar nova lista'),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
