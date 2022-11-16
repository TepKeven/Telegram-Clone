import 'package:assignment1/screens/class.dart';
import 'package:assignment1/screens/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  
  final int index;

  ChatPage({this.index = 0});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String message = "";
  ScrollController _listviewScroll = new ScrollController();
  TextEditingController _textFieldController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _listviewScroll.jumpTo(_listviewScroll.position.maxScrollExtent);
    });

    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody()
      
    );
    
  }

  AppBar buildAppbar(){
    return AppBar(
        backgroundColor: appbarColor,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back,color:Colors.white)
        ),
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing:15,
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(users[0].logo), fit: BoxFit.fill),
                    shape: BoxShape.circle),
            ),
            Text(users[0].title)
          ],
        ),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.more_vert,color:Colors.white))
        ],
    );
  }

  Widget buildBody(){
    return Stack(
      children: [
        ListView.builder(
          controller: _listviewScroll,
          padding: EdgeInsets.only(bottom:50),
          itemCount: messages.length,
          itemBuilder: (context,index){
            return Container(
              margin:EdgeInsets.only(top:10),
              child: Wrap(
                alignment: messages[index].sender == "me" ? WrapAlignment.end : WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 10,
                children: [
                  messages[index].sender != "me" ? 
                        Container(
                          width: 35,
                          height:35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(messages[index].profile),
                              fit: BoxFit.fill,
                            )
                          ), 
                        ): Container(),
                  Card(
                    color: messages[index].sender == "me" ? Colors.lightGreen.shade100 : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: messages[index].sender == "me" ? Colors.lightGreen.shade100 : Colors.white),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Wrap(
                        spacing: 10,
                        direction: Axis.vertical,
                        children: [
                          messages[index].sender != "me" ? Text(messages[index].sender,style:TextStyle(fontSize: 11,color:Colors.blue.shade300)) : Container(),
                          Wrap(
                            spacing: 5,
                            children: [
                              Text(messages[index].message),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(messages[index].time,
                                  style: TextStyle(fontSize: 9)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:5),
                                child: messages[index].seen ? messages[index].sender == "me" ? Wrap(children: [Icon(Icons.check,size: 12,),Icon(Icons.check,size:12)],) : Container() : Icon(Icons.check,size:12),
                              )
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                ],
              )
            );
          },
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.grey.shade100,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                IconButton(
                  splashRadius: 1,
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Icon Section"),
                          content: Text("No Icon Available"),
                          actions: [
                            ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              }, 
                               child: Text("Close")
                            )
                          ],
                        );
                      }
                    );
                  }, 
                  icon: Icon(Icons.sticky_note_2_sharp,color: Colors.grey,)),
                Expanded(
                  child: TextField(
                    controller: _textFieldController,
                    textAlignVertical: TextAlignVertical.top,
                    style: TextStyle(fontSize: 17),
                    decoration: InputDecoration(
                      hintText: "Message"
                    ),
                    onChanged: (value) => {
                      setState(() {
                        message = value;
                      })
                    },
                  ),
                ),
                message.length > 0 
                ? IconButton(
                    splashColor: Colors.transparent,
                    onPressed: (){
                      setState(() {
                        messages.add(Chat(message: message,profile: "../assets/images/user.jpg",seen: false,sender: "me",time: DateFormat.jm().format(DateTime.now())));
                      });
                      _textFieldController.clear();
                    }, 
                    icon: Icon(Icons.send,color:Colors.blue.shade300)
                  ) 
                : Wrap(
                    children: [
                      IconButton(onPressed: null, icon: Icon(Icons.attachment_outlined)),
                      IconButton(onPressed: null, icon: Icon(Icons.camera_alt_outlined))
                    ],
                  )
              ],
            ),
          )
        )
      ],
    );
  }
}