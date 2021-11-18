import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/end_drawer_widget.dart';
import '../components/header_logo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_page_with_login/post_page_with_login_widget.dart';
import '../terms_page/terms_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController confirmPasswordController;
  bool confirmPasswordVisibility;
  TextEditingController emailController2;
  TextEditingController passwordController2;
  bool passwordVisibility2;
  bool _loadingButton4 = false;
  bool _loadingButton5 = false;
  bool _loadingButton6 = false;
  TextEditingController emailController1;
  TextEditingController passwordController1;
  bool passwordVisibility1;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
    emailController2 = TextEditingController();
    passwordController2 = TextEditingController();
    passwordVisibility2 = false;
    emailController1 = TextEditingController();
    passwordController1 = TextEditingController();
    passwordVisibility1 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.textLight),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.textLight,
            size: 24,
          ),
        ),
        title: HeaderLogoWidget(),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      endDrawer: Drawer(
        elevation: 16,
        child: EndDrawerWidget(),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              labelColor: FlutterFlowTheme.textDark,
              unselectedLabelColor: FlutterFlowTheme.textDark,
              labelStyle: GoogleFonts.getFont(
                'Roboto',
              ),
              indicatorColor: FlutterFlowTheme.secondaryColor,
              tabs: [
                Tab(
                  text: 'ログイン',
                ),
                Tab(
                  text: 'ユーザー登録',
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 230,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: TextFormField(
                                      controller: emailController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'メールアドレス',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        hintText: 'メールアドレスを入力',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 230,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: TextFormField(
                                      controller: passwordController1,
                                      obscureText: !passwordVisibility1,
                                      decoration: InputDecoration(
                                        labelText: 'パスワード',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        hintText: 'パスワードを入力',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility1 =
                                                !passwordVisibility1,
                                          ),
                                          child: Icon(
                                            passwordVisibility1
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() => _loadingButton1 = true);
                                  try {
                                    final user = await signInWithEmail(
                                      context,
                                      emailController1.text,
                                      passwordController1.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PostPageWithLoginWidget(),
                                      ),
                                    );
                                  } finally {
                                    setState(() => _loadingButton1 = false);
                                  }
                                },
                                text: 'Sign in with  Email',
                                icon: Icon(
                                  Icons.mail,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  width: 230,
                                  height: 44,
                                  color: FlutterFlowTheme.secondaryColor,
                                  textStyle: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.textLight,
                                    fontSize: 17,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: 12,
                                ),
                                loading: _loadingButton1,
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: 230,
                              height: 44,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => _loadingButton2 = true);
                                        try {
                                          final user =
                                              await signInWithGoogle(context);
                                          if (user == null) {
                                            return;
                                          }
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PostPageWithLoginWidget(),
                                            ),
                                          );
                                        } finally {
                                          setState(
                                              () => _loadingButton2 = false);
                                        }
                                      },
                                      text: 'Sign in with Google',
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.transparent,
                                        size: 20,
                                      ),
                                      options: FFButtonOptions(
                                        width: 230,
                                        height: 44,
                                        color: Colors.white,
                                        textStyle: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Color(0xFF606060),
                                          fontSize: 17,
                                        ),
                                        elevation: 4,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: 12,
                                      ),
                                      loading: _loadingButton2,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.83, 0),
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        isAndroid
                            ? Container()
                            : Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    setState(() => _loadingButton3 = true);
                                    try {
                                      final user =
                                          await signInWithApple(context);
                                      if (user == null) {
                                        return;
                                      }
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PostPageWithLoginWidget(),
                                        ),
                                      );
                                    } finally {
                                      setState(() => _loadingButton3 = false);
                                    }
                                  },
                                  text: 'Sign in with Apple',
                                  icon: FaIcon(
                                    FontAwesomeIcons.apple,
                                    size: 20,
                                  ),
                                  options: FFButtonOptions(
                                    width: 230,
                                    height: 44,
                                    color: Colors.white,
                                    textStyle: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                    elevation: 4,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    borderRadius: 12,
                                  ),
                                  loading: _loadingButton3,
                                ),
                              ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TermsPageWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '利用規約',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.textDark,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(
                                        'https://www.particledrawing.com/privacy');
                                  },
                                  child: Text(
                                    'プライバシーポリシー',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.textDark,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 230,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: TextFormField(
                                      controller: emailController2,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'メールアドレス',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        hintText: 'メールアドレスを入力',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 230,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: TextFormField(
                                      controller: passwordController2,
                                      obscureText: !passwordVisibility2,
                                      decoration: InputDecoration(
                                        labelText: 'パスワード',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        hintText: 'パスワードを入力',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility2 =
                                                !passwordVisibility2,
                                          ),
                                          child: Icon(
                                            passwordVisibility2
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: 230,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.background,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: TextFormField(
                                      controller: confirmPasswordController,
                                      obscureText: !confirmPasswordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'パスワード',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        hintText: 'パスワードを再入力',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.textDark,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => confirmPasswordVisibility =
                                                !confirmPasswordVisibility,
                                          ),
                                          child: Icon(
                                            confirmPasswordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.textDark,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() => _loadingButton4 = true);
                                  try {
                                    if (passwordController1.text !=
                                        confirmPasswordController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Passwords don't match!",
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    final user = await createAccountWithEmail(
                                      context,
                                      emailController1.text,
                                      passwordController1.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    final usersCreateData =
                                        createUsersRecordData(
                                      email: emailController2.text,
                                    );
                                    await UsersRecord.collection
                                        .doc(user.uid)
                                        .update(usersCreateData);

                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PostPageWithLoginWidget(),
                                      ),
                                    );
                                  } finally {
                                    setState(() => _loadingButton4 = false);
                                  }
                                },
                                text: 'Sign up with  Email',
                                icon: Icon(
                                  Icons.mail,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  width: 230,
                                  height: 44,
                                  color: FlutterFlowTheme.secondaryColor,
                                  textStyle: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.textLight,
                                    fontSize: 17,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: 12,
                                ),
                                loading: _loadingButton4,
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: 230,
                              height: 44,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => _loadingButton5 = true);
                                        try {
                                          final user =
                                              await signInWithGoogle(context);
                                          if (user == null) {
                                            return;
                                          }
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PostPageWithLoginWidget(),
                                            ),
                                          );
                                        } finally {
                                          setState(
                                              () => _loadingButton5 = false);
                                        }
                                      },
                                      text: 'Sign up with Google',
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.transparent,
                                        size: 20,
                                      ),
                                      options: FFButtonOptions(
                                        width: 230,
                                        height: 44,
                                        color: Colors.white,
                                        textStyle: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Color(0xFF606060),
                                          fontSize: 17,
                                        ),
                                        elevation: 4,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: 12,
                                      ),
                                      loading: _loadingButton5,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.83, 0),
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        isAndroid
                            ? Container()
                            : Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    setState(() => _loadingButton6 = true);
                                    try {
                                      final user =
                                          await signInWithApple(context);
                                      if (user == null) {
                                        return;
                                      }
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PostPageWithLoginWidget(),
                                        ),
                                      );
                                    } finally {
                                      setState(() => _loadingButton6 = false);
                                    }
                                  },
                                  text: 'Sign up with Apple',
                                  icon: FaIcon(
                                    FontAwesomeIcons.apple,
                                    size: 20,
                                  ),
                                  options: FFButtonOptions(
                                    width: 230,
                                    height: 44,
                                    color: Colors.white,
                                    textStyle: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                    elevation: 4,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    borderRadius: 12,
                                  ),
                                  loading: _loadingButton6,
                                ),
                              ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ユーザー登録完了時に以下に同意したものとみなします。',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.textDark,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TermsPageWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '利用規約',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.textDark,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(
                                        'https://www.particledrawing.com/privacy');
                                  },
                                  child: Text(
                                    'プライバシーポリシー',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.textDark,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
