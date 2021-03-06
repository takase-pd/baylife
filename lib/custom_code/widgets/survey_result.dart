// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:charts_flutter/flutter.dart' as charts;

class SurveyResult extends StatefulWidget {
  const SurveyResult(
      {Key key, this.width, this.height, this.resultData, this.animate})
      : super(key: key);

  final double width;
  final double height;
  final List resultData;
  // TODO What does FALSE mean? -> the sample: HorizontalBarLabelChart
  final animate;

  @override
  _SurveyResultState createState() => _SurveyResultState();
}

class _SurveyResultState extends State<SurveyResult> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SurveyResultData, String>> seriesList = _createData();
    return charts.BarChart(
      seriesList,
      animate: widget.animate,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
  }

  List<charts.Series<SurveyResultData, String>> _createData() {
    final List<SurveyResultData> data =
        widget.resultData.map((e) => SurveyResultData(e.key, e.value)).toList();

    return [
      charts.Series<SurveyResultData, String>(
          id: 'Survey Reslut',
          domainFn: (SurveyResultData resultData, _) => resultData.choice,
          measureFn: (SurveyResultData resultData, _) => resultData.result,
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
              FlutterFlowTheme.of(context).pDark),
          data: data,
          insideLabelStyleAccessorFn: (SurveyResultData resultData, _) =>
              charts.TextStyleSpec(
                  color: charts.ColorUtil.fromDartColor(
                      FlutterFlowTheme.of(context).textLight)),
          outsideLabelStyleAccessorFn: (SurveyResultData resultData, _) =>
              charts.TextStyleSpec(
                  color: charts.ColorUtil.fromDartColor(
                      FlutterFlowTheme.of(context).textDark)),
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (SurveyResultData resultData, _) =>
              '${resultData.choice}: ${resultData.result.toString()} %')
    ];
  }
}

class SurveyResultData {
  final String choice;
  final double result;

  SurveyResultData(this.choice, this.result);
}
