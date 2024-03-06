import 'package:flutter/material.dart';
import 'package:onlyonly/comp/swiper.dart';
import 'package:onlyonly/main.dart';

import '../comp/VideoCard.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageStateless();
  }
}

List<Widget> list = [
  VideoCard(title: "震惊！",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),
  VideoCard(title: "震惊！tmd开学了",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),
  VideoCard(title: "震惊！tmd开学了",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),
  VideoCard(title: "震惊！tmd开学了",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),
  VideoCard(title: "震惊！tmd开学了",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),
  VideoCard(title: "震惊！tmd开学了",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),
  VideoCard(title: "震惊！tmd开学了",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),
  VideoCard(title: "震惊！tmd开学了",imgNetSrc: "https://www.z4a.net/images/2024/02/22/image-20240221222754434.png",up: "牛子精灵",func: (){},),

];

class HomePageStateless extends State<HomePage>{
  int imgIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        slivers: [
          SliverSafeArea(
              sliver: SliverAppBar(
                pinned: true,
                backgroundColor: Colors.lightGreen,
                leading: Container(
                  padding: const EdgeInsets.all(5),
                  width: 45,
                  height: 45,
                  child: Container(
                      clipBehavior: Clip.antiAlias, 
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey
                    ),
                    child: MainAppStateless.isLogin ? Head() : NoLogin(),
                  ),

                ),
                title: Container(
                  height: 80,
                  width: double.infinity,
                  // child: ,顶部
                ),
              ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 260,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: const HomeSwiper()
              // child: ,轮播图
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: list,
          ),
        ],
      ),
    );
  }
}

class Head extends StatelessWidget{
  const Head({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "userInfoPage");
      },
      child: Center(
        child: Container(
          width: 42,
          height: 42,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle
          ),
          child: Image.network("https://www.z4a.net/images/2024/02/22/head.th.jpg"),
        ),
      ),
    );
  }
}



class NoLogin extends StatelessWidget{
  const NoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        var result = await Navigator.pushNamed(context, "login");
        if(result == true){
          MainAppStateless.alreadyLogin();
          Navigator.popAndPushNamed(context, "home");
        }
      },
      child: Container(
        color: Colors.grey,
        child: const Center(
          child: Text(
              "未登录",
              style: TextStyle(
                color: Color.fromRGBO(68, 68, 68, 1.0),
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
          ),
        )
      )
    );
  }
}
