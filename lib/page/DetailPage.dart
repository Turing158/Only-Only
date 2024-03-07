import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlyonly/comp/VideoController.dart';

class DetailPage extends StatefulWidget{
  const DetailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DetailPageStateless();
  }

}

class DetailPageStateless extends State<DetailPage>{
  bool flag = false;
  late Timer t = Timer(Duration(milliseconds: 1), () { });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  GestureDetector(
                    onTapDown: (e){
                      setState(() {
                        flag = !flag;
                        if(t.isActive){
                          t.cancel();
                        }
                      });
                    },
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.blueGrey,
                      child: const VideoScreen(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: flag ? 1 : 0,
                      curve: Curves.easeInOut,
                      onEnd: (){
                        t = Timer(const Duration(seconds: 2), () {
                          setState(() {
                            flag = false;
                          });
                        });
                      },
                      child: Container(
                          height: 40,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: (){
                                    print("object");
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.arrow_back_ios_new),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.tv),
                                      ),
                                      Container(width: 20,),
                                      GestureDetector(
                                        child: Icon(Icons.more_horiz),
                                      ),
                                      Container(width: 10,),
                                    ],
                                  )
                              )
                            ],
                          )
                      ),
                    )
                  ),

                ],
              ),
            ),
            Expanded(
                child: CustomScrollView(
                  slivers: [],
                )
            )
          ],
        ),
      )
    );
  }

}