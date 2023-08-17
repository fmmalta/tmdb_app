import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/core/widgets/alert_widget.dart';
import 'package:movie_app/features/content/presentation/bloc/movie_bloc/movie_cubit.dart';

import 'package:movie_app/features/content/presentation/widgets/content_view_builder.dart';
import 'package:movie_app/features/content/presentation/widgets/news_content_headline.dart';
import 'package:movie_app/features/content/presentation/widgets/search_content_widget.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';

class MoviesTabView extends StatefulWidget {
  const MoviesTabView({super.key});

  @override
  State<MoviesTabView> createState() => _MoviesTabViewState();
}

class _MoviesTabViewState extends State<MoviesTabView> {
  final _key = GlobalKey<FormState>();
  bool enabledSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovies(),
      child: Form(
        key: _key,
        child: Scaffold(
          body: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              return Column(
                children: [
                  // SizedBox(height: 30.h),
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
                        type: ContentType.movie,
                        clearSearchContent: () {
                          _key.currentState?.reset();
                          setState(() {
                            enabledSearch = false;
                          });
                          context.read<MovieCubit>().getMovies();
                        },
                        onFieldSubmitted: (value) {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            context.read<MovieCubit>().searchMovies(value!);
                          }
                        },
                      ),
                      crossFadeState: enabledSearch
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 250),
                    ),
                  ),
                  if (state is MovieFailure &&
                      state.failure is NoConnectionFailure) ...[
                    Expanded(child: AlertWidget.noConnection()),
                  ] else if (state is MovieLoaded) ...[
                    Expanded(
                      child: AnimatedCrossFade(
                        crossFadeState: state.movies.isEmpty
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: const Center(
                          child: AlertWidget(
                              iconColor: Colors.white,
                              iconPath: 'assets/noMovieFoundIcon.svg',
                              description: 'Nenhum resultado encontrado'),
                        ),
                        secondChild: state is! MovieLoading
                            ? ContentViewBuilder(state.movies)
                            : const Center(
                                child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )),
                        duration: const Duration(milliseconds: 250),
                      ),
                    )
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
