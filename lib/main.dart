import 'package:flutter/material.dart';
import 'package:bay_life/home_page/home_page_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'flutter_flow/flutter_flow_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BayLife',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePageWidget(),
    );
  }
}
