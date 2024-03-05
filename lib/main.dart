import 'package:flutter/material.dart';
import 'package:onlyonly/page/HomePage.dart';
import 'package:onlyonly/page/LoginRegPage.dart';
import 'package:onlyonly/page/MainPage.dart';
import 'package:onlyonly/page/UserInfoPage.dart';




void main(){
  runApp(const MainApp());
}


class MainApp extends StatefulWidget{
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainAppStateless();
  }

}

class MainAppStateless extends State<MainApp>{
  static bool isLogin = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "only-only",
      home: const MainPage(),
      routes: {
        "login": (context) => const Login(),
        "reg": (context) => const Reg(),
        "userInfoPage": (context) => const UserInfoPage(),
        "home": (context) => const HomePage(),

      },
    );
  }


  static void alreadyLogin(){
    isLogin = true;
  }
}


