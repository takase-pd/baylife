import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLogoWidget extends StatefulWidget {
  HeaderLogoWidget({Key key}) : super(key: key);

  @override
  _HeaderLogoWidgetState createState() => _HeaderLogoWidgetState();
}

class _HeaderLogoWidgetState extends State<HeaderLogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageWidget(),
              ),
            );
          },
          child: Text(
            'MAKUHARI',
            style: FlutterFlowTheme.title2.override(
              fontFamily: 'Poppins',
              fontSize: 18,
            ),
          ),
        ),
        Text(
          'Bay Life',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
