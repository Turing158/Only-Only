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


  static double height = 0;
  static double width = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    height = screenSize.height;
    width = screenSize.width;
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


