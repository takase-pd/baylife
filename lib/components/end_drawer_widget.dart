import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import '../post_page/post_page_widget.dart';
import '../terms_page/terms_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndDrawerWidget extends StatefulWidget {
  EndDrawerWidget({Key key}) : super(key: key);

  @override
  _EndDrawerWidgetState createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 180, 10, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostPageWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        '投稿',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.tertiaryColor,
                      dense: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostPageWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        '要望送信',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.tertiaryColor,
                      dense: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsPageWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        '利用規約',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.tertiaryColor,
                      dense: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: InkWell(
                    onTap: () async {
                      await launchURL(
                          'https://www.particledrawing.com/privacy');
                    },
                    child: ListTile(
                      title: Text(
                        'プライバシーポリシー',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.tertiaryColor,
                      dense: false,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: InkWell(
              onTap: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPageWidget(),
                  ),
                  (r) => false,
                );
              },
              child: ListTile(
                title: Text(
                  'ログアウト',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                  ),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: FlutterFlowTheme.tertiaryColor,
                dense: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
