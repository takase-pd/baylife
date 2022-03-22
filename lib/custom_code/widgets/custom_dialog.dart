import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class CustomDialog {
  static final detailMessage = '\n詳細：';
  static final networkAlertTitle = '通信エラー';
  static final networkAlertMessage = 'データを取得できませんでした。通信状況の良い場所へ移動してください。';

  static void networkAlert(BuildContext context, String alert) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text(
          networkAlertTitle,
          style: FlutterFlowTheme.of(context).subtitle1.override(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
              color: FlutterFlowTheme.of(context).textDark),
        ),
        content: new Text(
          networkAlertMessage + detailMessage + alert,
          style: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Open Sans',
              color: FlutterFlowTheme.of(context).textDark),
        ),
        actions: <Widget>[
          new SimpleDialogOption(
            child: new Text(
              'OK',
              style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  color: FlutterFlowTheme.of(context).textDark),
            ),
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
          ),
        ],
      ),
    );
  }
}
