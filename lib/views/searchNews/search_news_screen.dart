import 'package:assignment/views/searchNews/search_delegate.dart';
import 'package:flutter/material.dart';

class SearchNewsScreen extends StatefulWidget {
  SearchNewsScreen({Key key}) : super(key: key);

  @override
  _SearchNewsScreenState createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  SearchAppBarDelegate _searchDelegate;

  @override
  void initState() {
    super.initState();
    _searchDelegate = SearchAppBarDelegate([]);
  }

  void showSearchPage(
      BuildContext context, SearchAppBarDelegate searchDelegate) async {
    showSearch<String>(context: context, delegate: searchDelegate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Hello Wolrd..!!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSearchPage(context, _searchDelegate);
        },
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ),
    );
  }
}
