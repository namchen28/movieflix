import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieflix/home_bloc/home_bloc.dart';
import 'package:movieflix/main.dart';
import 'package:movieflix/screen/movie_details_screen.dart';
import 'package:movieflix/screen/profile_screen.dart';
import 'package:movieflix/screen/search_screen.dart';
import 'package:movieflix/widget/home.dart';
import 'package:movieflix/widget/movie_slider.dart';
import 'package:movieflix/widget/trending_slider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeMovieClickedState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: state.movie)));
          }
        },
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.red),
              ),
            );
          } else if (state is HomeLoadingSuccessState) {
            final successState = state;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Movieflix',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.destructiveRed),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('trending',
                            style: Theme.of(context).textTheme.bodyLarge)
                        .tr(),
                    const SizedBox(
                      height: 16,
                    ),
                    TrendingSlider(
                        homeBloc: homeBloc,
                        movieModels: successState.trendingMovies),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'popular',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr(),
                    MovieSlider(
                        moviesModel: successState.popularMovies,
                        homeBloc: homeBloc),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'upcoming',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr(),
                    MovieSlider(
                        moviesModel: successState.upComingMovies,
                        homeBloc: homeBloc),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'topRated',
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr(),
                    MovieSlider(
                        moviesModel: successState.topRatedMovies,
                        homeBloc: homeBloc),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
