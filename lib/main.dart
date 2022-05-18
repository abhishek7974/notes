import 'package:baliza/firebase_options.dart';
import 'package:baliza/screen/add_notes.dart';
import 'package:baliza/screen/home_page.dart';
import 'package:baliza/screen/login_screen.dart';
import 'package:baliza/screen/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        SignUpScreen.routeName: (context) => SignUpScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomePage.routeName: (context) => HomePage(),
        AddNotes.routeName: (context) => AddNotes(),
      },
    );
  }
}
