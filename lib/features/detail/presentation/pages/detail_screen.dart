import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/core/widgets/alert_widget.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';
import 'package:movie_app/features/detail/presentation/cubit/detail_cubit.dart';
import 'package:movie_app/features/detail/presentation/widgets/add_content_to_list.dart';
import 'package:movie_app/features/detail/presentation/widgets/detail_content_overview.dart';
import 'package:movie_app/features/detail/presentation/widgets/detail_content_title.dart';
import 'package:movie_app/features/detail/presentation/widgets/season_list_widget.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';

class DetailScreen extends StatefulWidget {
  final Content content;
  const DetailScreen({required this.content, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailCubit>(
          create: (context) => DetailCubit()
            ..getContentDetail(widget.content, widget.content.type),
        ),
        BlocProvider<FavoriteListBloc>(
          create: (context) => FavoriteListBloc()..add(GetListsEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(widget.content.label)),
        floatingActionButton: Builder(
          builder: (context) {
            return BlocBuilder<DetailCubit, DetailState>(
              builder: (context, state) {
                return AnimatedCrossFade(
                  firstChild: const SizedBox(),
                  secondChild: FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => BlocProvider<FavoriteListBloc>.value(
                          value: context.read<FavoriteListBloc>(),
                          child: AddContentToList(content: widget.content),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/bottomListIcon.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  crossFadeState: state is DetailFailure
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 200),
                );
              },
            );
          },
        ),
        body: BlocBuilder<DetailCubit, DetailState>(
          builder: (context, state) {
            if (state is DetailLoading) {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ));
            }

            if (state is DetailLoaded) {
              final content = state.contentDetail;
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                children: [
                  DetailContentTile(content: content),
                  SizedBox(height: 15.h),
                  DetailContentOverview(content.overview),
                  SizedBox(height: 25.h),
                  if (content.type == ContentType.tv)
                    SeasonsListWidget(content.seasons)
                ],
              );
            }
            if (state is DetailFailure) {
              if (state.failure is NoConnectionFailure) {
                return Center(child: AlertWidget.noConnection());
              }
              return Center(
                child: Text(
                  "Tivemos um problema em carregar o conteúdo",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
