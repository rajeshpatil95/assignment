import 'dart:convert';
import 'package:assignment/blocs/search.dart';
import 'package:assignment/components/no_internet_screen.dart';
import 'package:assignment/events/news.dart';
import 'package:assignment/states/common_state.dart';
import 'package:assignment/utils/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsPage extends StatefulWidget {
  final String searchQuery;

  SearchResultsPage({this.searchQuery});

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
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
      searchBloc..add(FetchEverythingEventDispatched());
    } else {
      print("Network Issue..!! ${hasConnection}");
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (hasConnection) {
      return BlocListener<SearchBloc, CommonAppStates>(
        listener: (context, state) {},
        child: BlocBuilder<SearchBloc, CommonAppStates>(
          builder: (context, state) {
            if (searchBloc.fetchEverythingState is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (searchBloc.fetchEverythingState is Success) {
              final newsModelEverything = searchBloc?.newsModelEverything;

              return Container(
                alignment: Alignment.center,
                child: Text("${jsonEncode(newsModelEverything)}"),
              );
            } else {
              return Container();
            }
          },
        ),
      );
    }

    return NoInternetConnectionScreen(
      onPress: () async {
        await _fetchEverything();
      },
    );
  }
}
