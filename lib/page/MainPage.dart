import 'package:flutter/material.dart';
import 'package:onlyonly/page/HomePage.dart';
import 'package:onlyonly/page/InfoPage.dart';
import 'package:onlyonly/page/MsgPage.dart';
import 'package:onlyonly/page/UserPage.dart';



class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainPageStateless();
  }
}
class MainPageStateless extends State<MainPage>{
  List page = const [
    HomePage(),
    InfoPage(),
    MsgPage(),
    UserPage(),
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: pageIndex == 0 ? Colors.brown : Colors.indigo,),label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.free_breakfast_outlined, color: pageIndex == 1 ? Colors.pink : Colors.indigo,),label: "动态"),
          BottomNavigationBarItem(icon: Icon(Icons.message, color: pageIndex == 2 ? Colors.deepOrangeAccent : Colors.indigo,),label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box, color: pageIndex == 3 ? Colors.blue : Colors.indigo,),label: "用户")
        ],
        backgroundColor: const Color.fromARGB(255, 255, 255, 1),
        currentIndex: pageIndex,
        unselectedItemColor: Colors.indigo,
        unselectedLabelStyle: const TextStyle(
            color: Colors.indigo
        ),
        showUnselectedLabels: true,
        showSelectedLabels: false,
        onTap: (i){
          setState(() {
            pageIndex = i;
          });
        },
      ),
      body: page[pageIndex],
    );
  }

}

