import 'dart:async';
import 'package:assignment/app_state_container.dart/state_model.dart';
import 'package:assignment/blocs/search.dart';
import 'package:assignment/components/cache_netwrok_image.dart';
import 'package:assignment/components/svg_icon.dart';
import 'package:assignment/components/custom_search_delegate.dart';
import 'package:assignment/constants/constant.dart';
import 'package:assignment/events/wiki.dart';
import 'package:assignment/models/wiki.dart';
import 'package:assignment/routers/routes.dart';
import 'package:assignment/states/common_state.dart';
import 'package:assignment/theme/theme_config.dart';
import 'package:assignment/utils/Svg_IconsData.dart';
import 'package:assignment/views/searchWiki/search_description_page.dart';
import 'package:assignment/views/searchWiki/shimmer/word_suggestion_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';

//Search delegate
class SearchAppBarDelegate extends CustomSearchDelegate<String>
    with RouteAware {
  final List<String> _words;
  final List<String> _history;

  WikiBloc searchBloc;
  Timer debounceTimer;
  StateModel stateModel;

  SearchAppBarDelegate(List<String> words)
      : _words = words,
        //pre-populated history of words
        _history = <String>[],
        super() {}

  _searchState(BuildContext context) {
    if (debounceTimer != null) {
      debounceTimer.cancel();
    }

    if (this.query.length != 0) {
      debounceTimer = Timer(Duration(milliseconds: 500), () {
        BlocProvider.of<WikiBloc>(context)
          ..add(FetchTopHeadlinesEventDispatched(
              context: context, searchText: this.query, limit: 20));
      });
    } else {}
  }

  // @override onComp
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Colors.black87,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
  }

  // Builds page to populate search results.
  @override
  Widget buildResults(BuildContext context) {
    stateModel = ScopedModel.of<StateModel>(context);
    return Container();
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.only(right: 14.0),
                    child: FlatButton(
                      shape: CircleBorder(),
                      padding: const EdgeInsets.only(top: 4),
                      onPressed: () {
                        query = '';
                        showSuggestions(context);
                      },
                      child: SvgIconWidget(
                        SvgIcons.close,
                        height: 20,
                        width: 20,
                        color: ThemeConfiguration.themeDarkAccentColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    stateModel = ScopedModel.of<StateModel>(context);
    _searchState(context);

    return BlocBuilder(
      bloc: searchBloc,
      builder: (BuildContext context, CommonAppStates state) {
        if (searchBloc?.fetchTopHeadlinesState is Failed) {
          final error = searchBloc.fetchTopHeadlinesState as Failed;
          return Center(
            child: Text("${error.errorMsg}"),
          );
        } else if (searchBloc?.wikiModelTopHeadings?.query?.pages?.length ==
                0 &&
            this.query.length != 0) {
          return Center(child: Text('No results found..!!'));
        } else {
          if (this.query.length != 0) {
            return _WordSuggestionList(
              query: this.query,
              onSelected: (String value) {
                showResults(context);
              },
              onViewAll: () {
                showResults(context);
              },
            );
          } else {
            return Container();
          }
        }
      },
    );
  }
}

// Suggestions list widget displayed in the search page.
class _WordSuggestionList extends StatefulWidget {
  _WordSuggestionList({this.query, this.onSelected, this.onViewAll});

  final String query;
  final ValueChanged<String> onSelected;
  final Function onViewAll;

  @override
  __WordSuggestionListState createState() => __WordSuggestionListState();
}

class __WordSuggestionListState extends State<_WordSuggestionList> {
  WikiBloc searchBloc;

  @override
  initState() {
    super.initState();
    searchBloc = BlocProvider.of<WikiBloc>(context);
  }

  @override
  didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  List<TextSpan> highlightOccurrences(String source, String query) {
    if (query == null ||
        query.isEmpty ||
        !source.toLowerCase().contains(query.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  Widget _suggestionProducts(
      context, index, WikiModel wikiModelTopHeadings, String searchQuery) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, Routes.searchDescriptionPage,
        //     arguments: wikiModelTopHeadings?.query?.pages[index]);
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new SearchDescriptionPage(
                    page: wikiModelTopHeadings?.query?.pages[index])));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
              alignment: Alignment.centerRight,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 80,
                      child: wikiModelTopHeadings
                                  ?.query?.pages[index]?.thumbnail?.source !=
                              null
                          ? CacheNetworkImageLoader(
                              url: wikiModelTopHeadings?.query?.pages[index]
                                      ?.thumbnail?.source ??
                                  "",
                              loadingImage: LOADING_IMAGE.IMAGE,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              'assets/images/wiki.png',
                              fit: BoxFit.contain,
                            ),
                    ),
                    sizeBoxW5,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: RichText(
                            text: TextSpan(
                              children: highlightOccurrences(
                                  wikiModelTopHeadings
                                          ?.query?.pages[index]?.title ??
                                      '',
                                  widget.query),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        sizeBoxH8,
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: RichText(
                            text: TextSpan(
                              children: highlightOccurrences(
                                  wikiModelTopHeadings?.query?.pages[index]
                                          ?.terms?.description?.first ??
                                      '',
                                  widget.query),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WikiBloc, CommonAppStates>(
        listener: (context, state) {},
        child:
            BlocBuilder<WikiBloc, CommonAppStates>(builder: (context, state) {
          var wikiModelTopHeadings;
          if (searchBloc?.wikiModelTopHeadings?.query?.pages?.isNotEmpty ??
              false) {
            wikiModelTopHeadings = searchBloc?.wikiModelTopHeadings;
          }

          if (wikiModelTopHeadings?.query?.pages?.isNotEmpty ?? false) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                sizeBoxH10,
                Text(
                  '  Search Suggestions',
                  style: TextStyle(color: Colors.grey),
                ),
                sizeBoxH10,
                divider,
                Expanded(
                  child: ListView.builder(
                    itemCount: wikiModelTopHeadings?.query?.pages?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return _suggestionProducts(
                          context, index, wikiModelTopHeadings, widget.query);
                    },
                  ),
                ),
                // divider,
                // GestureDetector(
                //   onTap: () {
                //     widget.onViewAll();
                //   },
                //   child: Container(
                //     height: 35.0,
                //     padding: const EdgeInsets.only(
                //         left: 8.0, top: 10.0, bottom: 8.0),
                //     child: Text(
                //       "See interest over time",
                //       style: TextStyle(
                //         color: Colors.grey,
                //         decoration: TextDecoration.underline,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          } else {
            return WordSuggestionListShimmer();
          }
        }));
  }
}
