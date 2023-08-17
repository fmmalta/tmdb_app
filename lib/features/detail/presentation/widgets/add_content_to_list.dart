import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/presentation/widgets/add_content_to_list_if_not_empty.dart';
import 'package:movie_app/features/detail/presentation/widgets/create_favorite_list_if_empty.dart';

import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';

class AddContentToList extends StatefulWidget {
  final Content? content;
  const AddContentToList({this.content, super.key});

  @override
  State<AddContentToList> createState() => _AddContentToListState();
}

class _AddContentToListState extends State<AddContentToList> {
  bool toggle = false;

  void updateList() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 25.h,
      ),
      child: BlocBuilder<FavoriteListBloc, FavoriteListState>(
        builder: (context, state) {
          if (state is FavoriteListLoaded) {
            return AnimatedCrossFade(
              crossFadeState: state.contentEntity.listContent.isEmpty || toggle
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
              firstChild: const CreateFavoriteListIfEmpty(),
              secondChild: AddContentToListIfNotEmpty(
                content: widget.content,
                createListOnPressed: () {
                  updateList();
                },
              ),
            );
          }
          if (state is FavoriteListLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
