import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/model/movies_model.dart';
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
  List<Movies> movieList = [];

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
        print(state);
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
            return const Scaffold(
              body: Center(
                child: Text("Error"),
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
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(14)),
                          padding: const EdgeInsets.all(16),
                          controller: controller,
                          placeholder: 'Search',
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
                          style: const TextStyle(
                            fontSize: 18,
                          )),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                          itemCount: successState.movieList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  searchBloc.add(SearchMovieClickedEvent(
                                      movie: successState.movieList[index]));
                                },
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        successState
                                            .movieList[index].posterPath!,
                                        width: 120,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            successState
                                                .movieList[index].title!,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            successState
                                                .movieList[index].overview!,
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ],
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
