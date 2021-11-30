import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import '../login_page/login_page_widget.dart';
import '../terms_page/terms_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EndDrawerWidget extends StatefulWidget {
  const EndDrawerWidget({Key key}) : super(key: key);

  @override
  _EndDrawerWidgetState createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 200, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWidget(),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          'トップ',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPageWidget(),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          '投稿',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://www.particledrawing.com/contact');
                      },
                      child: ListTile(
                        title: Text(
                          '要望送信',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
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
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: InkWell(
                      onTap: () async {
                        await launchURL(
                            'https://www.particledrawing.com/privacy');
                      },
                      child: ListTile(
                        title: Text(
                          'プライバシーポリシー',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: InkWell(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('退会確認'),
                              content: Text(
                                  '退会するとユーザー情報、投稿が削除されます。退会しますか？＊退会をクリックすると、すぐに退会となります。'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('キャンセル'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(alertDialogContext);
                                    await currentUserReference.delete();
                                    ;
                                  },
                                  child: Text('退会'),
                                ),
                              ],
                            );
                          },
                        );
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      child: ListTile(
                        title: Text(
                          '退会',
                          style: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.textDark,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.textDark,
                          size: 20,
                        ),
                        dense: false,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.textDark,
                    ),
                  ),
                  trailing: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.textDark,
                    size: 20,
                  ),
                  dense: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
