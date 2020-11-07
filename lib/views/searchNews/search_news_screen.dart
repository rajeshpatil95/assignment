import 'package:assignment/theme/theme_config.dart';
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
        title: Text(
          "Flutter Wiki",
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: ThemeConfiguration.themeLightAccentColor),
        ),
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
        tooltip: 'Search',
        child: Icon(Icons.search),
      ),
    );
  }
}
