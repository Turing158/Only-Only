import 'package:flutter/material.dart';
class MsgCard extends StatefulWidget{
  MsgCard({
    this.nickName = "",
    this.content = "",
    this.head = "",
    this.isNew = false
  });
  bool isNew;
  String nickName;
  String content;
  String head;
  @override
  State<StatefulWidget> createState() {
    return MsgCardStateless(nickName: nickName,content: content,head: head,isNew: isNew);
  }

}

class MsgCardStateless extends State<MsgCard>{
  MsgCardStateless({
    this.nickName = "",
    this.content = "",
    this.head = "",
    this.isNew = false
});

  bool isNew;
  String nickName;
  String content;
  String head;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 5),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: ElevatedButton(
          onPressed: (){
            print("aa");
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: isNew ? Container(
                  margin: EdgeInsets.all(10),
                  height: 15,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(999)
                  ),
                  child: Center(
                    child: Text(
                        "new",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white
                      ),
                    ),
                  ),
                ) : Container(),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey
                        ),
                        child: Center(
                          child: Container(
                            width: 56,
                            height: 56,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(head),
                          ),
                        )
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 20,),
                      Container(
                        child: Text(
                          nickName,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(19, 19, 19, 1.0)
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5,right: 20),
                        width: 250,
                        child: Text(
                          content,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(150, 150, 150, 1.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        )
      ),
    );
  }

}