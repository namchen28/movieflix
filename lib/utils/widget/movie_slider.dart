import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/utils/constants.dart';
import 'package:movieflix/data/model/movies_model.dart';

import '../../features/movie/bloc/home_bloc.dart';

class MovieSlider extends StatelessWidget {
  final List<Movies> moviesModel;

  final Bloc homeBloc;
  const MovieSlider(
      {super.key, required this.moviesModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.36,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: moviesModel.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                homeBloc
                    .add(HomeMovieClickedEvent(movieId: moviesModel[index]));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.42,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      moviesModel[index].posterPath != null
                          ? '${Constant.imagePath}${moviesModel[index].posterPath}'
                          : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
