import 'package:flutter/material.dart';
import 'package:onlyonly/comp/VideoScreen.dart';
import 'package:onlyonly/main.dart';

class DetailPage extends StatefulWidget{
  const DetailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DetailPageStateless();
  }

}

class DetailPageStateless extends State<DetailPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 241, 1),
        body: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            children: [
              // Expanded(child: VideoScreen()),
              VideoScreen(),
              Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        
                      )
                    ],
                  )
              )
            ],
          ),
        )
    );
  }

}