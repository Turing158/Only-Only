import 'package:flutter/material.dart';
import 'package:onlyonly/main.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginStateless();
  }

}


class LoginStateless extends State<Login>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context,true);

          },
          child: const Text("登录"),
        ),
      ),
    );
  }

}