import 'package:assignment1/screens/chat.dart';
import 'package:assignment1/screens/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }

  Widget buildBody(){
    return ListView.separated(
        separatorBuilder: (context, index) {
            return Divider(height:3);
        },
        itemCount: users.length,
        itemBuilder: (context,index){
          return GestureDetector(
            child: buildHomeListTile(index),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage(index: index,)));
            },
          );
        }
      );
  }

  Widget buildHomeListTile(int index){
    return ListTile(
            leading: Container(
              width:50,
              height:50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    users[index].logo),
                    fit: BoxFit.fill),
                    shape: BoxShape.circle),
                  ),
            trailing: Wrap(
              spacing: 6,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                DateTime.now().difference(DateTime.parse(users[index].time)).inDays >= 1 ? Text(DateFormat("dd.MM.yy").format(DateTime.parse(users[index].time))) : Text(DateFormat.jm().format(DateTime.parse(users[index].time))), 
                users[index].chatUnseen > 0 
                ? Container(
                  child: Text(users[index].chatUnseen.toString(),style: TextStyle(fontSize: 11,color:Colors.white),),
                  padding:EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(13))),) 
                : users[index].pin ? Icon(Icons.push_pin_rounded,size: 18,) : Container(),
              ],
            ),
            title: Text(users[index].title),
            subtitle: Padding(
              padding: EdgeInsets.only(top:7.0),
              child: Text(users[index].lastChatName + ": " + users[index].message,style: TextStyle(fontSize: 12),),
            ),
          );
  }

  AppBar buildAppbar(){
    return AppBar(
        backgroundColor: appbarColor,
        title: Text("Telegram"),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.search,color:Colors.white))
        ],
      );
  }

  Widget buildDrawer(){
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height:150,
              child: DrawerHeader(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height:50,
                          decoration: BoxDecoration(
                            shape:BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("../assets/images/user.jpg")
                            )
                          ),
                        ),
                        IconButton(onPressed: null, icon: Icon(Icons.nightlight_round_rounded))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top:20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            spacing: 3,
                            direction: Axis.vertical,
                            children: [
                              Text("Tep Keven"),
                              Text("+855 12345678",style:TextStyle(fontSize: 12)),
                            ],
                          ),
                          IconButton(onPressed: null, icon: Icon(Icons.arrow_drop_down_rounded,size: 30,))
                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
            buildListTile(Icons.group_outlined, "New Grouo"),
            buildListTile(Icons.person_outline, "Contacts"),
            buildListTile(Icons.call_outlined, "Calls"),
            buildListTile(Icons.directions_run_outlined, "People Nearby"),
            buildListTile(Icons.bookmark_outline, "Saved Messages"),
            buildListTile(Icons.settings_outlined, "Settings"),
            Divider(height: 3),
            buildListTile(Icons.person_add_outlined, "Invite Friends"),
            buildListTile(Icons.help_outline_outlined, "Telegram Features")

          ],
        ),
      );
  }

  Widget buildListTile(IconData icon,String text){
    return ListTile(
            leading: Icon(icon),
            title:Text(text),
          );
  }
}