import 'dart:async';

import 'package:flutter/material.dart';

import 'Video.dart';
class VideoScreen extends StatefulWidget{
  const VideoScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    return VideoScreenStateless();
  }

}


class VideoScreenStateless extends State<VideoScreen>{
  bool flag = false;
  bool flagController = false;
  late Timer t = Timer(Duration(milliseconds: 1), () { });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Stack(
        children: [
          GestureDetector(
            onTapDown: (e){
              setState(() {
                flag = !flag;
                flagController = true;
                if(t.isActive){
                  t.cancel();
                }
              });
            },
            child: Container(
              height: 300,
              width: double.infinity,
              color: Colors.blueGrey,
              child: const Video(),
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
                      t = Timer(Duration(seconds: 2), () {
                        setState(() {
                          flagController = false;
                        });
                      });
                    });
                  });
                },
                child: flagController ? Container(
                    height: 40,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: (){
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
                ):Container(),
              )
          ),

        ],
      ),
    );
  }

}