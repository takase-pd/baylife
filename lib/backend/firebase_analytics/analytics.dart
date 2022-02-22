import 'dart:async';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'analytics_event_type.dart';

class Analytics {
  static String _isEventType;
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static Future analyticsLogEvent(
      AnalyticsEventType eventType, Map<String, dynamic> parameterMap) async {
    _isEventType = await _enumToString(eventType);
    await analytics.logEvent(
      name: _isEventType,
      parameters: parameterMap,
    );
  }

  static Future _enumToString(eventType) async {
    return eventType.toString().split('.')[1];
  }
}
