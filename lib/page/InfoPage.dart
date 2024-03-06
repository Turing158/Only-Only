import 'dart:math';

import 'package:flutter/material.dart';

import '../comp/TrendsCard.dart';

class InfoPage extends StatefulWidget{
  const InfoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return InfoPageStateless();
  }
}



class InfoPageStateless extends State<InfoPage>{
  List<Widget> infoList = [];
  InfoPageStateless(){
    for(int i=0;i<10;i++){
      infoList.add(
        TrendsCard(title: "测试${i + 1}",content: "测试内容${i + 1}",date: "2021/${i + 1}/${i + 1} ${i + 1}:${i + 1}:${i + 1}",author: "牛子${i + 1}",head: "https://www.z4a.net/images/2024/02/22/head.th.jpg",like: Random().nextInt(100),comment: Random().nextInt(100),),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverSafeArea(
              sliver: SliverAppBar(
                backgroundColor: Colors.lightGreen,
              ),
          ),
          SliverToBoxAdapter(
            child: Container(height: 15,),
          ),
          SliverFixedExtentList.list(
              children: infoList,
              itemExtent: 200
          ),
          SliverToBoxAdapter(
            child: Container(height: 15,),
          ),
        ],
      ),
    );
  }
}


