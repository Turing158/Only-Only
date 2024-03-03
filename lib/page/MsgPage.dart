import 'package:flutter/material.dart';

class MsgPage extends StatefulWidget{
  const MsgPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MsgPageStateless();
  }
}



class MsgPageStateless extends State<MsgPage>{
  @override
  Widget build(BuildContext context) {
    return const Text("Msg");
  }

}