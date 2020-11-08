import 'dart:convert';
import 'package:assignment/blocs/search.dart';
import 'package:assignment/components/no_internet_screen.dart';
import 'package:assignment/events/news.dart';
import 'package:assignment/models/news.dart';
import 'package:assignment/states/common_state.dart';
import 'package:assignment/theme/theme_config.dart';
import 'package:assignment/utils/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class SearchDescriptionPage extends StatefulWidget {
  final Pages page;

  SearchDescriptionPage({this.page});

  @override
  _SearchDescriptionPageState createState() => _SearchDescriptionPageState();
}

class _SearchDescriptionPageState extends State<SearchDescriptionPage> {
  bool hasConnection = true;
  SearchBloc searchBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBloc = BlocProvider.of<SearchBloc>(context);
    _fetchEverything();
  }

  _fetchEverything() async {
    hasConnection = await hasConnectivity();
    if (hasConnection) {
      searchBloc
        ..add(FetchEverythingEventDispatched(
            context: context, searchText: widget.page.title, limit: 1));
    } else {
      print("Network Issue..!! ${hasConnection}");
    }
    if (mounted) setState(() {});
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.of(context).pop();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (hasConnection) {
      return WillPopScope(
          onWillPop: () => _onBackPressed(context),
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text("${widget.page.title}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            )),
                        background: Image.network(
                          widget.page.thumbnail.source,
                          fit: BoxFit.cover,
                        )),
                  ),
                ];
              },
              body: BlocListener<SearchBloc, CommonAppStates>(
                listener: (context, state) {},
                child: BlocBuilder<SearchBloc, CommonAppStates>(
                  builder: (context, state) {
                    if (searchBloc.fetchEverythingState is Loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (searchBloc.fetchEverythingState is Success) {
                      return ListView(
                        children: [
                          Html(
                            data: """
                            ${searchBloc.topicDescription}
                            """,
                            padding: EdgeInsets.only(left: 8.0, right: 8),
                            onLinkTap: (url) {
                              print("Opening $url...");
                            },
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ));
    }

    return NoInternetConnectionScreen(
      onPress: () async {
        await _fetchEverything();
      },
    );
  }
}
