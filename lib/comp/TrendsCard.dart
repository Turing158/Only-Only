import 'package:flutter/material.dart';
class TrendsCard extends StatelessWidget{
  TrendsCard({
    super.key,
    this.title = "",
    this.content = "",
    this.author = "",
    this.head = "",
    this.date = "",
    this.like = 0,
    this.comment = 0
  });

  String title;
  String content;
  String author;
  String head;
  String date;
  int like;
  int comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
      width: double.infinity,
      child: GestureDetector(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(241, 241, 241, 1)
          ),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 48,
                        height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            color: Colors.blueGrey
                          ),
                        child: Center(
                          child: Container(
                              width: 45,
                              height: 45,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle
                              ),
                              child: Image.network(head)
                          ),
                        )
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 4,),
                          Text(
                              author,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                          Container(height: 4,),
                          Text(
                              date,
                            style: const TextStyle(
                              color: Color.fromRGBO(100, 100, 100, 1),
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 2,left: 20),
                      child: Text(
                          title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                      height: 65,
                      child: Text(
                          content,
                        softWrap: true,
                        style: const TextStyle(
                          overflow: TextOverflow.clip
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "$like👍",
                            style: const TextStyle(
                              color: Color.fromRGBO(150, 150, 150, 1)
                            ),
                          ),
                          Container(width: 10,),
                          Text(
                              "$comment",
                            style: const TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1)
                            ),
                          ),
                          const Icon(Icons.comment,size: 15,color: Color.fromRGBO(150, 150, 150, 1),)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}