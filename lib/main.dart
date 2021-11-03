
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motoreise_app/Options.dart';
import 'package:motoreise_app/signupform_screen.dart';

import 'HomePage.dart';
import 'login_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange,
        accentColor: Colors.orange,
      ),
      home: HomePage1(),
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FirebaseUser user = snapshot.data;
          return HomePage();
        } else {
          return Options() ;
        }
      },
    );
  }
}