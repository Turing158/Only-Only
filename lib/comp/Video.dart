import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class Video extends StatefulWidget{
  Video({super.key});

  VideoState videoState = VideoState();
  void pause(){
    videoState.pause();
  }
  void play(){
    videoState.play();
  }
  @override
  State<Video> createState() {
    return videoState;
  }

}

class VideoState extends State<Video>{
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void pause(){
    _controller.pause();
  }
  void play(){
    _controller.play();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller.play();
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

}