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
  bool flagPause = false;
  late Timer t = Timer(Duration(milliseconds: 1), () { });
  Video video = Video();

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
                              Navigator.pop(context);
                              video.pause();
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
          Align(
              alignment: Alignment.bottomCenter,
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
                          child: flag ? GestureDetector(
                            onTap: (){
                              setState(() {
                                video.play();
                                if(t.isActive){
                                  t.cancel();
                                }
                              });
                              t = Timer(Duration(seconds: 2), () {
                                setState(() {
                                  flag = false;
                                });
                              });
                            },
                            child: Icon(Icons.pause),
                          ) : GestureDetector(
                            onTap: (){
                              setState(() {
                                video.pause();
                              });
                            },
                            child: Icon(Icons.play_arrow),
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
            child: flagPause ? GestureDetector(
              child: Icon(Icons.play_arrow),
              onTap: (){
                setState(() {
                  video.pause();
                  flagPause = true;
                });
              },
            ) : GestureDetector(
              child: Icon(Icons.pause),
              onTap: (){
                setState(() {
                  video.play();
                  flagPause = false;
                });
              },
            ),
          )
        ],
      ),
    );
  }

}