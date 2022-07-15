import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import '../backend/backend.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page/home_page_widget.dart';
import 'survey_page/survey_page_widget.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'ecommerce_page/ecommerce_page_widget.dart';
import 'index.dart';

import 'backend/stripe/payment_manager.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:badges/badges.dart';
import '../backend/api_requests/api_calls.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import './custom_code/widgets/index.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<VersionCheck>(() => VersionCheck());
}

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: '6LeoJqgeAAAAALN1AqR5kS1JGm7j_b763i1EVuis',
  );

  await initializeStripe();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;

  Stream<BayLifeFirebaseUser> userStream;
  BayLifeFirebaseUser initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => initPlugin());
    userStream = bayLifeFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BayLife',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('ja', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: FlutterFlowTheme.of(context).tertiaryColor,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/BayLifeIcon_v2_splash.png',
                    width: 256,
                    height: 256,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? PushNotificationsHandler(child: NavBarPage())
              : NavBarPage(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        observer,
      ],
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key key,
    this.initialPage,
  }) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  int numSurveys = 0;

  final appCheck = FirebaseAppCheck.instance;

  void countSurveys() async {
    querySurveyRecord()
      ..listen((surveys) async {
        List _surveys = [];
        List _answers = [];
        int _numAnswered = 0;
        int _numCounted = 0;

        surveys.forEach((survey) {
          bool display = survey.display;
          bool open = survey.open;
          String sid = survey.sid;
          if (display && open) {
            _surveys.add(sid);
            _numCounted += 1;
          }
        });

        final _appCheckToken = await AppCheckAgent.getToken(context);
        if (currentUser.loggedIn && _appCheckToken != null) {
          final apiCallOutput = await AnswersCall.call(
            uid: currentUserUid,
            accessToken: currentJwtToken,
            appCheckToken: _appCheckToken,
          );
          _answers = getJsonField(apiCallOutput.jsonBody, r'''$.result''');
          _answers.forEach(
              (answer) => {(_surveys.contains(answer)): _numAnswered += 1});
        }
        setState(() => numSurveys = _numCounted - _numAnswered);
      });
  }

  @override
  void initState() {
    final checker = locator<VersionCheck>();
    checker
        .versionCheck()
        .then((needUpdate) => CustomDialog.appUpdate(context, needUpdate));
    countSurveys();
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'SurveyPage': SurveyPageWidget(),
      'EcommercePage': EcommercePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => {setState(() => _currentPage = tabs.keys.toList()[i])},
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: FlutterFlowTheme.of(context).tDark,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.infoCircle,
              size: 24,
            ),
            label: '地域情報',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: numSurveys == 0
                ? FaIcon(
                    FontAwesomeIcons.solidComments,
                    size: 24,
                  )
                : Badge(
                    badgeContent: Text(
                      numSurveys.toString(),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Open Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: FlutterFlowTheme.of(context).textLight),
                    ),
                    badgeColor: FlutterFlowTheme.of(context).pDark,
                    child: FaIcon(
                      FontAwesomeIcons.solidComments,
                      size: 24,
                    ),
                  ),
            label: 'アンケート',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_sharp,
              size: 24,
            ),
            label: 'ショップ',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
