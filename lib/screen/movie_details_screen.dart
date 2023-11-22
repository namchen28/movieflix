import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieflix/bloc/movie_detail_bloc.dart';
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
  final VideoModel video = VideoModel();
  final MovieDetailBloc movieDetailBloc = MovieDetailBloc();

  @override
  void initState() {
    movieDetailBloc.add(MovieDetailInitialEvent(movieId: widget.movie));
    super.initState();
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
        if (state is AddToFavoriteListState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to favorite list'),
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
            return const Scaffold(
              body: Center(
                child: Text("Error"),
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
                                  image: NetworkImage(
                                      successState.movieDetail.posterPath!),
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
                                            style: GoogleFonts.nunito(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                                          style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      successState.movieDetail.overview!,
                                      style: GoogleFonts.nunito(
                                          color: CupertinoColors.systemGrey4,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Release Date: $releaseDateView",
                                      style: const TextStyle(
                                        color: CupertinoColors.systemGrey4,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Cast",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    CastWidget(castList: successState.cast),
                                    const Text(
                                      "Review",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const ButtonCustom(
                                    iconData: Icon(Icons.arrow_back_ios_new),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    movieDetailBloc.add(AddToFavoriteListEvent(
                                        movie: widget.movie));
                                  },
                                  child: const ButtonCustom(
                                    iconData: Icon(Icons.bookmark_rounded),
                                  ),
                                ),
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
    return const SizedBox(
      child: Text('No Review'),
    );
  }
}
