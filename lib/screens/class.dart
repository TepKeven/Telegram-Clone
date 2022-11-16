class User{
  late String logo;
  late String title;
  late String message;
  late String lastChatName;
  late int chatUnseen;
  late bool pin;
  late String time;
  
  User({this.logo = "../assets/images/logo.jpg",this.title = "",this.message = "",this.lastChatName = "",this.chatUnseen = 0,this.pin = false,this.time = "2022-02-01 03:04:05"});
}

class Chat{
  late String message;
  late String time;
  late String profile;
  late String sender;
  late bool seen;

  Chat({this.message = "",this.time = "",this.profile = "../assets/images/user.jpg",this.sender = "me",this.seen = false });
}


