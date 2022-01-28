// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom widget code
class SurveyResult extends StatefulWidget {
  const SurveyResult({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _SurveyResultState createState() => _SurveyResultState();
}

class _SurveyResultState extends State<SurveyResult> {
  @override
  Widget build(BuildContext context) {
    return // Generated code for this Row Widget...
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'test',
            style: FlutterFlowTheme.subtitle2,
          ),
          Text(
            '32.1 %',
            style: FlutterFlowTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
