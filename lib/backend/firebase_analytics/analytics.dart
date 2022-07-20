import 'dart:async';
import 'dart:math';
import '../../auth/auth_util.dart';
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

const kMaxEventNameLength = 40;
const kMaxParameterLength = 100;

void logFirebaseEvent(String eventName, {Map<String, dynamic> parameters}) {
  // https://firebase.google.com/docs/reference/cpp/group/event-names
  assert(eventName.length <= kMaxEventNameLength);

  parameters ??= {};
  parameters.putIfAbsent(
      'user', () => currentUserUid.isEmpty ? currentUserUid : 'unset');
  parameters.removeWhere((k, v) => k == null || v == null);

  // FB Analytics allows num values but others need to be converted to strings
  // and cannot be more than 100 characters.
  for (final entry in parameters.entries) {
    if (entry.value is! num) {
      var valStr = entry.value.toString();
      if (valStr.length > kMaxParameterLength) {
        valStr = valStr.substring(0, min(valStr.length, kMaxParameterLength));
      }
      parameters[entry.key] = valStr;
    }
  }

  FirebaseAnalytics.instance.logEvent(name: eventName, parameters: parameters);
}
