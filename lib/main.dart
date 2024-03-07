import 'package:flutter/material.dart';
import 'package:onlyonly/page/DetailPage.dart';
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
  static bool isLogin = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "only-only",
      home: const MainPage(),
      routes: {
        "login": (context) => const Login(),
        "reg": (context) => const Reg(),
        "userInfo": (context) => const UserInfoPage(),
        "home": (context) => const HomePage(),
        "detail": (context) => const DetailPage(),
      },
    );
  }


  static void alreadyLogin(){
    isLogin = true;
  }
}


