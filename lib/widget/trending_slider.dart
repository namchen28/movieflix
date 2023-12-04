import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/model/movies_model.dart';
import 'package:movieflix/movie/bloc/home_bloc.dart';

class TrendingSlider extends StatelessWidget {
  final HomeBloc homeBloc;
  final List<Movies> movieModels;
  const TrendingSlider({
    super.key,
    required this.homeBloc,
    required this.movieModels,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider(
          items: movieModels
              .map((movie) => GestureDetector(
                    onTap: () {
                      homeBloc.add(HomeMovieClickedEvent(movieId: movie));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              movie.posterPath != null
                                  ? '${Constant.imagePath}${movie.posterPath}'
                                  : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                            ),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              height: 300,
              autoPlay: true,
              viewportFraction: 0.6,
              autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
              autoPlayAnimationDuration: const Duration(seconds: 3))),
    );
  }
}
