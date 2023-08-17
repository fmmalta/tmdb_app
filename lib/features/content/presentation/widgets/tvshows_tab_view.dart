import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/failure.dart';

import 'package:movie_app/core/widgets/alert_widget.dart';
import 'package:movie_app/features/content/presentation/bloc/tvshows_cubit/tvshows_cubit.dart';
import 'package:movie_app/features/content/presentation/widgets/content_view_builder.dart';
import 'package:movie_app/features/content/presentation/widgets/news_content_headline.dart';
import 'package:movie_app/features/content/presentation/widgets/search_content_widget.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';

class TVShowsTabView extends StatefulWidget {
  const TVShowsTabView({super.key});

  @override
  State<TVShowsTabView> createState() => _TVShowsTabViewState();
}

class _TVShowsTabViewState extends State<TVShowsTabView> {
  final _key = GlobalKey<FormState>();
  bool enabledSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TvshowsCubit>(
      create: (context) => TvshowsCubit()..getTVShows(),
      child: Form(
        key: _key,
        child: Scaffold(
          body: BlocBuilder<TvshowsCubit, TvshowsState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 20.h,
                    ),
                    child: AnimatedCrossFade(
                      firstChild: NewContentHeadline(() {
                        setState(() {
                          enabledSearch = true;
                        });
                      }),
                      secondChild: SearchContentWidget(
                        type: ContentType.tv,
                        clearSearchContent: () {
                          _key.currentState?.reset();
                          setState(() {
                            enabledSearch = false;
                          });
                          context.read<TvshowsCubit>().getTVShows();
                        },
                        onFieldSubmitted: (value) {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            context.read<TvshowsCubit>().searchTvShows(value!);
                          }
                        },
                      ),
                      crossFadeState: enabledSearch
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 250),
                    ),
                  ),
                  if (state is TvshowsLoading) ...[
                    const Center(
                        child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ))
                  ],
                  if (state is TVShowFailure &&
                      state.failure is NoConnectionFailure) ...[
                    Expanded(child: AlertWidget.noConnection()),
                  ] else if (state is TvshowsLoaded) ...[
                    Expanded(
                      child: AnimatedCrossFade(
                        crossFadeState: state.tvshows.isEmpty
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: const Center(
                          child: AlertWidget(
                              iconColor: Colors.white,
                              iconPath: 'assets/noTvShowFound.svg',
                              description: 'Nenhum resultado encontrado'),
                        ),
                        secondChild: state is! TvshowsLoading
                            ? ContentViewBuilder(state.tvshows)
                            : const Center(
                                child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )),
                        duration: const Duration(milliseconds: 250),
                      ),
                    )
                  ]
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
