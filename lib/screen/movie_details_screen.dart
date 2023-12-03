import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/bloc/movie_detail_bloc.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/model/cast_model.dart';
import 'package:movieflix/model/review_model.dart';
import 'package:movieflix/model/movies_model.dart';
import 'package:movieflix/model/video_model.dart';
import 'package:movieflix/widget/button.dart';
import 'package:movieflix/widget/cast_widget.dart';
import 'package:movieflix/widget/review_card.dart';
import 'package:movieflix/widget/watch_trailer_widget.dart';

class MovieDetailPage extends StatefulWidget {
  final Movies movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final VideoModel video = const VideoModel();
  final MovieDetailBloc movieDetailBloc = MovieDetailBloc();
  bool isFavorite = false;

  @override
  void initState() {
    movieDetailBloc.add(MovieDetailInitialEvent(movieId: widget.movie));
    super.initState();
    checkFavoriteStatus();
  }

  final userId = FirebaseAuth.instance.currentUser?.uid;
  Future<bool> checkFavoriteStatus() async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      if (data.containsKey('favoriteMovies')) {
        final List<String> favoriteMovies =
            List<String>.from(data['favoriteMovies']);
        isFavorite = favoriteMovies.contains(widget.movie.id.toString());
        print(isFavorite);
        return isFavorite;
      }
    }
    return false;
  }

  Future<void> _toggleFavorite() async {
    if (await checkFavoriteStatus()) {
      movieDetailBloc.add(RemoveFromFavoriteListEvent(movie: widget.movie));
    } else {
      movieDetailBloc.add(AddToFavoriteListEvent(movie: widget.movie));
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;
    return BlocConsumer<MovieDetailBloc, MovieDetailState>(
      bloc: movieDetailBloc,
      listener: (context, state) {
        if (state is WatchTrailerNavigateState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WatchTrailerWidget(videoId: state.videoId)));
        }
        if (state is WatchTrailerErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('trailer').tr(),
              duration: Duration(seconds: 2),
            ),
          );
        }
        if (state is AddToFavoriteListState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('addFavorite').tr(),
              duration: Duration(seconds: 1),
            ),
          );
        }
        if (state is RemoveFromFavoriteListState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('removeFavorite').tr(),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      listenWhen: (previous, current) => current is MovieDetailActionState,
      buildWhen: (previous, current) => current is! MovieDetailActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case MovieDetailLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          case MovieDetailErrorState:
            return Scaffold(
              body: Center(
                child: const Text("error").tr(),
              ),
            );
          case MovieDetailLoadingSuccessState:
            var successState = (state as MovieDetailLoadingSuccessState);
            String? releaseDateView = successState.movieDetail.releaseDate;
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(alignment: Alignment.topCenter, children: [
                        Column(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              height: size.height * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(successState
                                              .movieDetail.posterPath !=
                                          null
                                      ? "${Constant.imagePath}${successState.movieDetail.posterPath}"
                                      : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                              successState.movieDetail.title!,
                                              maxLines: 5,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            movieDetailBloc.add(
                                                WatchTrailerNavigateEvent(
                                                    movieId: successState
                                                        .movieDetail));
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              color: CupertinoColors
                                                  .destructiveRed,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.play_arrow_rounded,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Icon(
                                          size: 20,
                                          CupertinoIcons.star_fill,
                                          color: CupertinoColors.systemYellow,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                            '${successState.movieDetail.voteAverage!.toStringAsFixed(1)} (${successState.movieDetail.voteCount})',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(successState.movieDetail.overview!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    const SizedBox(height: 16),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(text: "releaseDate".tr()),
                                      TextSpan(
                                          text: ": $releaseDateView",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ])),
                                    const SizedBox(height: 20),
                                    Text("cast",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge)
                                        .tr(),
                                    const SizedBox(height: 16),

                                    // CastWidget(castList: successState.cast) ,
                                    _getCast(successState.cast),
                                    const SizedBox(height: 16),
                                    Text("review",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge)
                                        .tr(),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    _getReviews(successState.review),
                                  ]),
                            ),
                          ],
                        ),
                        Positioned(
                          top: safePadding + 4,
                          left: 8,
                          right: 8,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const ButtonCustom(
                                    iconData: Icon(Icons.arrow_back_ios_new),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      _toggleFavorite();
                                    },
                                    child: isFavorite
                                        ? const ButtonCustom(
                                            iconData: Icon(
                                            Icons.bookmark_rounded,
                                          ))
                                        : const ButtonCustom(
                                            iconData: Icon(
                                              Icons.bookmark_border_rounded,
                                            ),
                                          )),
                              ]),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}

class SectionListView extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const SectionListView({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}

Widget _getCast(List<CastModels>? cast) {
  if (cast != null && cast.isNotEmpty) {
    return CastWidget(castList: cast);
  } else {
    return Text("noDetail").tr();
  }
}

Widget _getReviews(List<ReviewModel>? reviews) {
  if (reviews != null && reviews.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionListView(
          height: 175,
          itemCount: reviews.length,
          itemBuilder: (context, index) => ReviewCard(
            review: reviews[index],
          ),
        ),
      ],
    );
  } else {
    return SizedBox(
      child: Text('noDetail').tr(),
    );
  }
}
