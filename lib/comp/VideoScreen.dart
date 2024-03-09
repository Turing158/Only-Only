import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onlyonly/main.dart';

import 'Video.dart';
class VideoScreen extends StatefulWidget{
  const VideoScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    return VideoScreenStateless();
  }

}


class VideoScreenStateless extends State<VideoScreen>{
  bool flag = true;
  bool flagPause = false;
  late Timer t = Timer(Duration(seconds: 5), () {
    setState(() {
      flag = false;
    });
  });
  Video video = Video();

  @override
  Widget build(BuildContext context) {

    return AnimatedRotation(
      turns: 1,
      duration: Duration(milliseconds: 300),
      child: Container(
        width: MainAppStateless.width,
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
                child: video,
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: flag ? 1 : 0,
                  curve: Curves.easeInOut,
                  onEnd: flag ? (){
                    t = Timer(const Duration(seconds: 5), () {
                      setState(() {
                        flag = false;
                      });
                    });
                  }:(){

                  },
                  child: Container(
                      height: 40,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: flag ? (){
                                Navigator.pop(context);
                                video.pause();
                              }:(){},
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
            Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: flag ? 1 : 0,
                  curve: Curves.easeInOut,
                  child: Container(
                      height: 40,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: flagPause ? GestureDetector(
                              onTap: flag?(){
                                setState(() {
                                  flagPause = false;
                                  video.play();
                                });
                              }:(){},
                              child: Icon(Icons.play_arrow),
                            ) : GestureDetector(
                              onTap: flag?(){
                                setState(() {
                                  flagPause = true;
                                  video.pause();
                                });
                              }:(){},
                              child: Icon(Icons.pause),
                            ),
                          ),
                          Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Icon(Icons.volume_down),
                                  ),
                                  Container(width: 20,),
                                  GestureDetector(
                                    child: Icon(Icons.fullscreen),
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
            Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: flag ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: flagPause ? GestureDetector(
                    child: Icon(Icons.play_arrow),
                    onTap: (){
                      setState(() {
                        flagPause = false;
                        video.play();
                      });
                    },
                  ) : GestureDetector(
                    child: Icon(Icons.pause),
                    onTap: (){
                      setState(() {
                        flagPause = true;
                        video.pause();
                      });
                    },
                  ),

                )
            )
          ],
        ),
      ),
    );
  }

}