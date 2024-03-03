import 'package:flutter/cupertino.dart';

class HomeSwiper extends StatelessWidget{
  const HomeSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: PageView(
        children: [
          Image.network("https://www.z4a.net/images/2024/01/18/ppt0.md.jpg",fit: BoxFit.fitWidth,),
          Image.network("https://www.z4a.net/images/2024/01/18/ppt1.md.jpg",fit: BoxFit.fitWidth,),
          Image.network("https://www.z4a.net/images/2024/01/18/ppt2.md.jpg",fit: BoxFit.fitWidth,),
          Image.network("https://www.z4a.net/images/2024/01/18/ppt3.md.jpg",fit: BoxFit.fitWidth,),
          Image.network("https://www.z4a.net/images/2024/01/18/ppt4.md.jpg",fit: BoxFit.fitWidth,),
          Image.network("https://www.z4a.net/images/2024/01/18/ppt5.md.jpg",fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }

}