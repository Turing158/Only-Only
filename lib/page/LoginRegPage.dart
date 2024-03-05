import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {

    return LoginStateless();
  }

}


class LoginStateless extends State<Login>{
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLooking = false;

  _look(){
    setState(() {
      isLooking = !isLooking;
    });
  }

  _clearUser(){
    userController.clear();
  }

  _reg(){
    Navigator.pushNamed(context, "reg");
  }
  _login(){
    Navigator.pop(context,true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1.0),
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.teal,
              ),
            ),
            Container(height: 30,),
            Container(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Input(
                    controller: userController,
                    onSuffixPressed: _clearUser,
                    suffixIcon: const Icon(Icons.highlight_off),
                    prefixIcon: const Icon(Icons.account_box,color: Colors.indigoAccent,),
                    label: "用户名",
                    hintText: "请输入用户名",
                    maxLine: 12,
                    onlyNumAndAlphaNotSpace: true,
                  ),
                  Container(height: 10,),
                  Input(
                    controller: passwordController,
                    onSuffixPressed: _look,
                    suffixIcon: Icon(isLooking ? Icons.remove_red_eye: Icons.looks),
                    prefixIcon: const Icon(Icons.password,color: Colors.indigoAccent,),
                    label: "密码",
                    hintText: "请输入密码",
                    maxLine: 16,
                    onlyNumAndAlphaNotSpace: false,
                    hideText: !isLooking,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50,right: 50),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 80,
                            height: 40,
                            child: OperateButton(
                              onPressed: _reg,
                              text: "注册",
                            )
                          )
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: OperateButton(
                            onPressed: _login,
                            text: "登录",
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
class Reg extends StatefulWidget{
  const Reg({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegStateless();
  }

}

class RegStateless extends State<Reg>{
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isLooking1 = false;
  bool isLooking2 = false;
  var errorPasswordAgainText = null;
  _look1(){
    setState(() {
      isLooking1 = !isLooking1;
    });
  }
  _look2(){
    setState(() {
      isLooking2 = !isLooking2;
    });
  }
  _clearUser(){
    userController.clear();
  }
  _clearEmail(){
    emailController.clear();
  }
  _checkPasswordAgain(e){
    setState(() {
      bool flag = passwordController.value.text == passwordAgainController.value.text;
      if(flag){
        errorPasswordAgainText = null;
      }
      else{
        errorPasswordAgainText = "输入的密码与第一次不同";
      }
    });
  }
  _reg(){
    Navigator.pop(context, true);
  }
  _login(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("注册"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.teal,
              ),
            ),
            Container(height: 30,),
            Container(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Input(
                    controller: userController,
                    onSuffixPressed: _clearUser,
                    suffixIcon: const Icon(Icons.highlight_off),
                    prefixIcon: const Icon(Icons.account_box,color: Colors.indigoAccent,),
                    label: "用户名",
                    hintText: "请输入用户名",
                    maxLine: 12,
                    onlyNumAndAlphaNotSpace: true,
                  ),
                  Container(height: 10,),
                  Input(
                    controller: passwordController,
                    onSuffixPressed: _look1,
                    suffixIcon: Icon(isLooking1 ? Icons.remove_red_eye: Icons.looks),
                    prefixIcon: const Icon(Icons.password,color: Colors.indigoAccent,),
                    label: "密码",
                    hintText: "请输入密码",
                    maxLine: 16,
                    onlyNumAndAlphaNotSpace: false,
                    hideText: !isLooking1,
                  ),
                  Container(height: 10,),
                  Input(
                    controller: passwordAgainController,
                    onSuffixPressed: _look2,
                    suffixIcon: Icon(isLooking2 ? Icons.remove_red_eye: Icons.looks),
                    prefixIcon: const Icon(Icons.password,color: Colors.indigoAccent,),
                    label: "密码",
                    hintText: "请再次输入密码",
                    maxLine: 16,
                    onlyNumAndAlphaNotSpace: false,
                    onChange: _checkPasswordAgain,
                    hideText: !isLooking2,
                    errorText: errorPasswordAgainText,
                  ),
                  Container(height: 10,),
                  Input(
                    controller: emailController,
                    onSuffixPressed: _clearEmail,
                    suffixIcon: const Icon(Icons.highlight_off),
                    prefixIcon: const Icon(Icons.alternate_email,color: Colors.indigoAccent,),
                    label: "邮箱",
                    hintText: "请输入邮箱",
                    maxLine: -1,
                    onlyNumAndAlphaNotSpace: false,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50,right: 50),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                width: 80,
                                height: 40,
                                child: OperateButton(
                                  onPressed: _reg,
                                  text: "注册",
                                )
                            )
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: OperateButton(
                              onPressed: _login,
                              text: "登录",
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}


class OperateButton extends StatelessWidget{
  OperateButton({
    super.key,
    this.width = 80,
    this.height = 40,
    required this.onPressed,
    this.text = "",
    this.textStyle = const TextStyle(
        color: Color.fromRGBO(241, 241, 241, 1),
        fontWeight: FontWeight.bold,
        fontSize: 15
    ),
  });

  double width;
  double height;
  Function()? onPressed;
  String text;
  TextStyle textStyle;
  ButtonStyle btnStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
      side: MaterialStateProperty.all(const BorderSide(width: 2,color: Colors.black12)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: btnStyle,
          child: Text(
            text,
            style: textStyle,
          ),
      ),
    );
  }

}

class Input extends StatelessWidget{
  Input({
    super.key,
    required this.controller,
    required this.onSuffixPressed,
    required this.suffixIcon,
    this.onlyNumAndAlphaNotSpace = true,
    this.prefixIcon,
    this.maxLine = -1,
    this.label = "",
    this.hintText = "",
    this.onChange,
    this.hideText = false,
    this.errorText
  });


  TextEditingController controller;
  Function()? onSuffixPressed;
  final ValueChanged<String>? onChange;
  bool onlyNumAndAlphaNotSpace;
  Widget? prefixIcon;
  Widget suffixIcon;
  int maxLine;
  String label;
  String hintText;
  bool hideText;
  var errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: onlyNumAndAlphaNotSpace ? [
        FilteringTextInputFormatter.deny(
            RegExp("[\\s]")
        ),
        FilteringTextInputFormatter.allow(
            RegExp("[a-zA-Z]|[0-9]")
        )
      ] : [],
      maxLength: maxLine,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      obscureText: hideText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: suffixIcon,
          onPressed: onSuffixPressed,
        ),
        errorText: errorText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2,color: Colors.green),borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: onChange,
    );
  }

}