import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../backend/firebase_analytics/analytics.dart';

class CustomDialog {
  static TextStyle titleStyle(BuildContext context) =>
      FlutterFlowTheme.of(context).subtitle1.override(
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
          color: FlutterFlowTheme.of(context).textDark);

  static TextStyle messageStyle(BuildContext context) =>
      FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Open Sans',
          color: FlutterFlowTheme.of(context).textDark);

  static TextStyle buttonStyle(BuildContext context) =>
      FlutterFlowTheme.of(context).bodyText2.override(
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
          color: FlutterFlowTheme.of(context).textDark);

  static showCustomDialog(BuildContext context, bool barrierDismissible,
      String title, String message, String label, Function action) {
    logFirebaseEvent('ButtonAlertDialog');
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: titleStyle(context),
        ),
        content: Text(
          message,
          style: messageStyle(context),
        ),
        actions: [
          TextButton(
            child: Text(
              label,
              style: buttonStyle(context),
            ),
            onPressed: () => action(),
          )
        ],
      ),
    );
  }

  static void _launchURL(String url) async {
    logFirebaseEvent('LaunchURL');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void networkAlert(BuildContext context) async {
    const title = '通信エラー';
    const message = 'データを取得できませんでした。通信環境の良い場所へ移動してください。';
    const label = 'OK';

    showCustomDialog(
        context, true, title, message, label, () => Navigator.pop(context));
  }

  static void appUpdate(BuildContext context, bool needUpdate) {
    if (!needUpdate) return;

    const title = "バージョンアップのお知らせ";
    const message =
        "Bay Lifeをご利用いただき、ありがとうございます。新しいバージョンのアプリが公開されました。アップデートをお願いいたします。";
    const label = "今すぐ更新";
    const APP_STORE_URL =
        'https://apps.apple.com/jp/app/makuhari-baylife/id1582919405';
    const PLAY_STORE_URL =
        'https://play.google.com/store/apps/details?id=com.particledrawing.baylife';

    showCustomDialog(
        context,
        false,
        title,
        message,
        label,
        () => Platform.isIOS
            ? _launchURL(APP_STORE_URL)
            : _launchURL(PLAY_STORE_URL));
  }
}
