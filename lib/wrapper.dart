// import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

import 'auth/login.dart';
class wrapper extends StatelessWidget {
  
  FirebaseAuth _auth=FirebaseAuth.instance;
  wrapper({super.key});
  // final AuthService auth = Provider.of(context).auth;

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<User?>(
    stream: _auth.authStateChanges(),
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasData) {
        return HomePage();
      } else {
        return LogIn();
      }
    },
    );
    
}
}