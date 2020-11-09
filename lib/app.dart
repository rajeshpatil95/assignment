import 'package:assignment/routers/routes.dart';
import 'package:assignment/services/client/wiki.dart';
import 'package:assignment/theme/theme_config.dart';
import 'package:assignment/utils/connectivity.dart';
import 'package:assignment/utils/data_connectivity.dart';
import 'package:assignment/views/searchNews/search_wiki_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app_state_container.dart/state_model.dart';
import 'application.dart';
import 'blocs/search.dart';
import 'components/no_internet_screen.dart';

Application _application;
Application get application => _application;
set _appObj(ap) {
  _application = ap;
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

var materialNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  StateModel stateModel;
  Dio dioWikiApi;
  InternetConnectionStatus internetConnectionStatus;

  @override
  void initState() {
    init();
    super.initState();
  }

  connectivity() async {
    var hasC = await hasConnectivity();
    if (hasC) {
      internetConnectionStatus = InternetConnectionStatus.Connected;
      setState(() {});
    } else {
      internetConnectionStatus = InternetConnectionStatus.NoConnection;
      setState(() {});
    }
  }

  init() async {
    connectivity();
    stateModel = StateModel();
    dioWikiApi = Dio();

    //Wiki Dio
    dioWikiApi.options
      ..baseUrl = "https://en.wikipedia.org"
      ..contentType = "application/json";

    _appObj = Application(
      dioWikiApi: dioWikiApi,
    );
  }

  @override
  Widget build(BuildContext context) {
    var widgets = ScopedModel<StateModel>(
        model: stateModel,
        child: (MultiBlocProvider(
            providers: [
              BlocProvider<WikiBloc>(
                create: (context) => WikiBloc(
                    wikiApiClient: WikiApiClient(dioWikiApi: dioWikiApi)),
              ),
            ],
            child: MaterialApp(
                builder: (BuildContext context, Widget child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child,
                  );
                },
                title: 'Assignment',
                navigatorKey: materialNavigatorKey,
                onGenerateRoute: (s) => Routes.onGenerateRoute(s),
                theme: ThemeConfiguration.defaultTheme(context),
                navigatorObservers: [],
                home: MaterialApp(
                  home: Material(child: SearchWikiScreen()),
                )))));

    if (internetConnectionStatus == InternetConnectionStatus.Connected)
      return widgets;
    else if (internetConnectionStatus == InternetConnectionStatus.NoConnection)
      return MaterialApp(
        home: Material(child: NoInternetConnectionScreen(
          onPress: () {
            init();
          },
        )),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child,
          );
        },
      );
    else
      return MaterialApp(
        home: Material(
          child: Container(),
        ),
      );
  }
}
