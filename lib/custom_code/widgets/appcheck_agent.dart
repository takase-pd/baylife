import 'package:flutter/material.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import './index.dart';

class AppCheckAgent {
  static final appCheck = FirebaseAppCheck.instance;

  static Future<String> getToken(BuildContext context) async {
    await appCheck.activate();
    String appCheckToken = await appCheck.getToken();
    appCheckToken ?? CustomDialog.networkAlert(context);
    return appCheckToken;
  }
}
