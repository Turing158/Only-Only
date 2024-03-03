import 'package:flutter/material.dart';

class UserPage extends StatefulWidget{
  const UserPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserPageStateless();
  }
}



class UserPageStateless extends State<UserPage>{
  @override
  Widget build(BuildContext context) {
    return const Text("User");
  }

}