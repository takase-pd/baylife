import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../login_page/login_page_widget.dart';
import '../../content_page/content_page_widget.dart';
import '../../category_page/category_page_widget.dart';
import '../../post_page_with_login/post_page_with_login_widget.dart';
import '../../confirm_page/confirm_page_widget.dart';
import '../../terms_page/terms_page_widget.dart';
import '../../survey_post_page/survey_post_page_widget.dart';
import '../../survey_result_page/survey_result_page_widget.dart';
import '../../my_page/my_page_widget.dart';
import '../../my_page_dev/my_page_dev_widget.dart';
import '../../my_page_edit/my_page_edit_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).tertiaryColor,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/BayLifeIcon_v1.png',
                width: 256,
                height: 256,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'LoginPage': (data) async => LoginPageWidget(),
  'ContentPage': (data) async => ContentPageWidget(
        contentRef: getParameter(data, 'contentRef'),
      ),
  'CategoryPage': (data) async => CategoryPageWidget(
        catRef: getParameter(data, 'catRef'),
      ),
  'PostPageWithLogin': (data) async => PostPageWithLoginWidget(),
  'ConfirmPage': (data) async => ConfirmPageWidget(
        catName: getParameter(data, 'catName'),
        catNameAdd: getParameter(data, 'catNameAdd'),
        title: getParameter(data, 'title'),
        overview: getParameter(data, 'overview'),
        detail: getParameter(data, 'detail'),
        organizer: getParameter(data, 'organizer'),
        contact: getParameter(data, 'contact'),
        homepage: getParameter(data, 'homepage'),
        postName: getParameter(data, 'postName'),
        postEmail: getParameter(data, 'postEmail'),
        postPhone: getParameter(data, 'postPhone'),
        postOccupation: getParameter(data, 'postOccupation'),
        permission: getParameter(data, 'permission'),
        address: getParameter(data, 'address'),
        startDay: getParameter(data, 'startDay'),
        finalDay: getParameter(data, 'finalDay'),
        filePath: getParameter(data, 'filePath'),
        postRemarks: getParameter(data, 'postRemarks'),
      ),
  'TermsPage': (data) async => TermsPageWidget(
        termsUrl: getParameter(data, 'termsUrl'),
      ),
  'SurveyPage': (data) async => NavBarPage(initialPage: 'SurveyPageWidget'),
  'SurveyPostPage': (data) async => SurveyPostPageWidget(
        surveyRef: getParameter(data, 'surveyRef'),
      ),
  'SurveyResultPage': (data) async => SurveyResultPageWidget(
        surveyRef: getParameter(data, 'surveyRef'),
      ),
  'MyPage': (data) async => MyPageWidget(
        surveyRef: getParameter(data, 'surveyRef'),
      ),
  'MyPageDev': (data) async => MyPageDevWidget(
        surveyRef: getParameter(data, 'surveyRef'),
      ),
  'MyPageEdit': (data) async => MyPageEditWidget(
        surveyRef: getParameter(data, 'surveyRef'),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
