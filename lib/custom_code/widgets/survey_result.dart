// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

// Begin custom widget code
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
    return new charts.BarChart(
      seriesList,
      animate: widget.animate,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis:
          new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  }

  List<charts.Series<SurveyResultData, String>> _createData() {
    final List<SurveyResultData> data = widget.resultData
        .map((e) => new SurveyResultData(e.key, e.value))
        .toList();

    return [
      new charts.Series<SurveyResultData, String>(
          id: 'Survey Reslut',
          domainFn: (SurveyResultData resultData, _) => resultData.choice,
          measureFn: (SurveyResultData resultData, _) => resultData.result,
          data: data,
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
