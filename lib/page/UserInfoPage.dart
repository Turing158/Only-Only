import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget{
  const UserInfoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserInfoPageStateless();
  }

}

class UserInfoPageStateless extends State<UserInfoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        title: const Text("用户信息"),
      ),
      body: Text("用户信息")
    );
  }

}