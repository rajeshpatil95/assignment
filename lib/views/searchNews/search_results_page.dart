import 'package:flutter/material.dart';

class SearchResultsPage extends StatefulWidget {
  final String searchQuery;

  SearchResultsPage({this.searchQuery});

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center, child: Text("Search Results Page"));
  }
}
