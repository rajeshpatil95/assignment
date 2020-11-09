import 'package:assignment/components/custom_search_delegate.dart';
import 'package:assignment/constants/constant.dart';
import 'package:assignment/theme/theme_config.dart';
import 'package:assignment/views/searchNews/search_delegate.dart';
import 'package:flutter/material.dart';

class SearchWikiScreen extends StatefulWidget {
  SearchWikiScreen({Key key}) : super(key: key);

  @override
  _SearchWikiScreenState createState() => _SearchWikiScreenState();
}

class _SearchWikiScreenState extends State<SearchWikiScreen> {
  SearchAppBarDelegate _searchDelegate;

  @override
  void initState() {
    super.initState();
    _searchDelegate = SearchAppBarDelegate([]);
  }

  void showSearchPage(
      BuildContext context, SearchAppBarDelegate searchDelegate) async {
    customShowSearch<String>(context: context, delegate: searchDelegate);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 300,
            child: Image.asset(
              'assets/images/wiki_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Flutter Wiki",
            style: Theme.of(context)
                .textTheme
                .display2
                .copyWith(color: ThemeConfiguration.themeDarkColor),
          ),
          sizeBoxH3,
          Text("Click on the search icon to explore",
              style: TextStyle(
                  fontSize: 12, color: ThemeConfiguration.themeDarkColor)),
        ],
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
