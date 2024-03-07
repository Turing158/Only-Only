import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget{
  const VideoCard({
    super.key,
    required this.title,
    required this.imgNetSrc,
    required this.up,
    required this.func

  });
  final String title;
  final String imgNetSrc;
  final String up;
  final Function()? func;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: func,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(250, 250, 250, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 4,
                child: Image.network(imgNetSrc,fit: BoxFit.cover,),
              ),
              Container(height: 10,),
              Expanded(
                flex: 2,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        flex: 7,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: Text(
                            title,
                            style: const TextStyle(
                                color:Color.fromRGBO(19, 19, 19, 1.0),
                                fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            alignment: Alignment.topLeft,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                const Icon(Icons.account_box_outlined,size: 13,),
                                Container(width: 5,),
                                Text(
                                  up,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(100, 100, 100, 1.0)
                                  ),
                                ),
                                const Expanded(
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.more_vert,size: 15,),
                                        )
                                      ],
                                    ))
                              ],
                            )
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}