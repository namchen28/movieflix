import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/screen/movie_details_screen.dart';
import 'package:movieflix/search_bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc searchBloc = SearchBloc();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    searchBloc.add(SearchInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      bloc: searchBloc,
      listener: (context, state) {
        if (state is SearchMovieClickedState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: state.movie)));
        }
      },
      listenWhen: (previous, current) => current is SearchActionState,
      buildWhen: (previous, current) => current is! SearchActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SearchLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          case SearchErrorState:
            return Scaffold(
              body: Center(
                child: const Text("error").tr(),
              ),
            );
          case SearchLoadingSuccessState:
            var successState = (state as SearchLoadingSuccessState);
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoTextField(
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              borderRadius: BorderRadius.circular(14)),
                          padding: const EdgeInsets.all(16),
                          controller: controller,
                          placeholder: 'search'.tr(),
                          placeholderStyle: const TextStyle(color: Colors.grey),
                          prefix: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.search, color: Colors.red),
                          ),
                          prefixMode: OverlayVisibilityMode.always,
                          onChanged: (value) {
                            searchBloc.add(SearchQueryEvent(query: value));
                          },
                          cursorColor: Colors.red,
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.55,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          itemCount: successState.movieList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  searchBloc.add(SearchMovieClickedEvent(
                                      movie: successState.movieList[index]));
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        successState.movieList[index]
                                                    .posterPath !=
                                                null
                                            ? '${Constant.imagePath}${successState.movieList[index].posterPath}'
                                            : 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                                        width: double.infinity,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        successState.movieList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
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
