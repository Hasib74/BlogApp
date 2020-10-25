import 'package:blog_app/AppHelper/AppTheme.dart';
import 'package:blog_app/FlutterProvider/AnimationProvider.dart';
import 'package:blog_app/FlutterProvider/AuthenticationProvider.dart';
import 'package:blog_app/FlutterProvider/LogInAndRegistationProvider.dart';
import 'package:blog_app/FlutterProvider/SplashScreenProvider.dart';
import 'package:blog_app/Language/AppLocalizations.dart';
import 'package:blog_app/Language/Language.dart';
import 'package:blog_app/Route/GenaratedRoute.dart';
import 'package:blog_app/Route/Route.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Language language = Language();
SharedPreferences prefs;

double mainHeight, mainWidth, paddingTop, appbarHeight;

String firebaseToken;

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguage()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AnimationProvider()),
        ChangeNotifierProvider(create: (_) => LogInAndRegistationProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
        create: (BuildContext context) => AppLanguage(),
        child: Consumer<AppLanguage>(builder: (context, model, child) {
          return ConnectivityAppWrapper(
              app: MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale(model.appLocale),
            supportedLocales: LocaleHelper.getAllLocale(),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            //theme: AppTheme(),
            //routes: appRoutes,
            onGenerateRoute: onGenaratedRoute,
            initialRoute: SPLASH_SCREEN,
          ));
        }));
  }
}
