import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieflix/home_bloc/home_bloc.dart';
import 'package:movieflix/screen/movie_details_screen.dart';
import 'package:movieflix/widget/movie_slider.dart';
import 'package:movieflix/widget/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    print('Initializing HomeScreen');
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          print('Received state: $state');

          if (state is HomeMovieClickedState) {
            print('Navigating to MovieDetailPage with movie: ${state.movie}');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: state.movie)));
          }
        },
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        builder: (context, state) {
          print('Building with state: $state');
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
                backgroundColor: Colors.transparent,
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
                    Text('Trending Movies',
                        style: GoogleFonts.aBeeZee(fontSize: 20)),
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
                      'Popular Movies',
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                    MovieSlider(
                        moviesModel: successState.popularMovies,
                        homeBloc: homeBloc),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Upcoming Movies',
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
                    MovieSlider(
                        moviesModel: successState.upComingMovies,
                        homeBloc: homeBloc),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Top rated Movies',
                      style: GoogleFonts.aBeeZee(fontSize: 20),
                    ),
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
