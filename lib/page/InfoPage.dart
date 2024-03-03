import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget{
  const InfoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return InfoPageStateless();
  }
}



class InfoPageStateless extends State<InfoPage>{
  @override
  Widget build(BuildContext context) {
    return const Text("Info");
  }

}