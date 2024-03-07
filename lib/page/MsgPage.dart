import 'dart:math';

import 'package:flutter/material.dart';
import '../comp/MsgCard.dart';
class MsgPage extends StatefulWidget{
  const MsgPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MsgPageStateless();
  }
}



class MsgPageStateless extends State<MsgPage>{
  List<Widget> msgList = [];
  MsgPageStateless(){
    for(int i=0;i<50;i++){
      msgList.add(
        MsgCard(nickName: "牛子${i+1}",content: "我是内容${i+1}",isNew: (Random().nextInt(1) == 1),head: "https://www.z4a.net/images/2024/02/22/head.th.jpg",)
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(sliver: SliverAppBar(
            backgroundColor: Colors.lightGreen,
          )),
          SliverFixedExtentList.list(
              children: msgList,
              itemExtent: 100
          ),
        ],
      ),
    );
  }

}