import 'package:flutter/material.dart';
import 'package:onlyonly/main.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverSafeArea(sliver: SliverAppBar(
            backgroundColor: Colors.lightGreen,
          )),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(241, 241, 241, 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: GestureDetector(
                  onTap: MainAppStateless.isLogin ? (){
                    //登陆后
                    Navigator.pushNamed(context, "userInfo");
                  } : (){
                  //   登陆前
                    Navigator.pushNamed(context, "login");
                  },
                  child: Container(
                    width: 210,
                    color: const Color.fromRGBO(241, 241, 241, 1),
                    child: MainAppStateless.isLogin ? IsLogin(nickname: "NickName",head: "https://www.z4a.net/images/2024/02/22/head.th.jpg",lv: 1,nowLevel: 132,endLevel: 320,) : const NotLogin(),
                  )
                )
              ),
            ),
          )
        ],
      ),
    );
  }

}


class IsLogin extends StatelessWidget{
  IsLogin({
    super.key,
    this.nickname = "",
    this.head = "",
    this.lv = 0,
    this.nowLevel = 1,
    this.endLevel = 2
  });
  String nickname;
  String head;
  int lv;
  int nowLevel;
  int endLevel;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            width: 90,
            height: 90,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey
            ),
            child: Center(
              child: Container(
                  width: 86,
                  height: 86,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(head)
              ),
            )
          ),
          Container(
            width: 230,
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                    child: Text(
                        "Lv. $lv",
                      style: const TextStyle(
                        color: Color.fromRGBO(100, 100, 100, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                Positioned(
                  top: 8,
                    child: Container(
                      width: 200,
                      alignment: Alignment.topRight,
                      child: Text(
                          "$nowLevel/$endLevel",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(100, 100, 100, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ),
                Positioned(
                    top: 25,
                    width: 200,
                    height: 10,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(200, 200, 200, 1.0),
                            borderRadius: BorderRadius.circular(999)
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          child: Container(
                            width: (nowLevel/endLevel)*200,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[100],
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        )
                      ],
                    ),
                ),
                Positioned(
                  top: 50,
                    left: 20,
                    child: Text(
                        "-$nickname-",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                )
              ],
            ),

          )
        ],
      ),
    );
  }
}


class NotLogin extends StatelessWidget{
  const NotLogin({super.key});


  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        "未 登 录 ， 请 点 击 登 录 !",
        style: TextStyle(
          color: Colors.lightBlue,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
    );
  }
}