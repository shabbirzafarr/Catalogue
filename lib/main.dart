import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';
import 'package:hello_world/theme/theme.dart';
import 'package:hello_world/widget/lending.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_world/wrapper.dart';

import 'auth/login.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EasySplashScreen(
        backgroundColor: Color(0xFF004AAD),
        logo: Image(image: AssetImage("assets/images/logo.jpg")),
        title: Text("Catalogue"),
        navigator: wrapper(),
        ),
      themeMode: ThemeMode.dark,
      theme: Mytheme.lighttheme(context),

      debugShowCheckedModeBanner: false,
      //darkTheme: ThemeData(brightness: Brightness.dark),
      // routes: {
      //   "/": (context) => HomePage(),
      //   "/login": (context) => LogIn(),
      //   "/home": (context) => HomePage(),
      //   // "/directing":(context) => lending(Item item)
      // },
    );
  }
}
