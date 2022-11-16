import 'package:assignment1/screens/class.dart';
import 'package:flutter/cupertino.dart';

List<User> users = [
  User(logo: "../assets/images/logo.jpg", title: "Physic Class",message: "Hello Everyone",lastChatName: "Keven",chatUnseen: 0,pin: true, time: "2022-01-11 11:00:00"),
  User(logo: "../assets/images/logo.jpg", title: "Math Class",message: "You are welcome",lastChatName: "Mike",chatUnseen: 200,pin: true, time: "2022-01-01 12:55:00"),
  User(logo: "../assets/images/logo.jpg", title: "Chemistry Class",message: "Chemical Reaction",lastChatName: "Ben",chatUnseen: 300,pin: true, time: "2022-01-02 13:02:00"),
  User(logo: "../assets/images/logo.jpg", title: "Art Class",message: "Painting",lastChatName: "John",chatUnseen: 400,pin: true, time: "2022-02-03 10:11:00"),
  User(logo: "../assets/images/logo.jpg", title: "Khmer Class",message: "Hello",lastChatName: "Sambath",chatUnseen: 10,pin: false, time: "2022-02-01 11:11:11"),
  User(logo: "../assets/images/logo.jpg", title: "English Class",message: "Good Morning",lastChatName: "Chris",chatUnseen: 0,pin: false, time: "2022-02-01 10:20:30"),
  User(logo: "../assets/images/logo.jpg", title: "Chinese Class",message: "你们好",lastChatName: "Xiao Ming",chatUnseen: 20,pin: false, time: "2022-01-31 05:50:35"),
  User(logo: "../assets/images/logo.jpg", title: "Chinese Class Morning",message: "你们好",lastChatName: "Xiao Mei",chatUnseen: 20,pin: false, time: "2022-02-01 17:20:35"),
  User(logo: "../assets/images/logo.jpg", title: "Chinese Class Afternoon",message: "你们好",lastChatName: "Xiang Wen",chatUnseen: 40,pin: false, time: "2022-01-01 05:40:35"),
];

List<Chat> messages = [
  Chat(message: "Hello",time: "11:50 AM",profile: "../assets/images/user.jpg",sender: "me",seen: true ),
  Chat(message: "Hi there",time: "11:50 AM",profile: "../assets/images/user.jpg",sender: "John",seen: true ),
  Chat(message: "How are you now?",time: "11:51 AM",profile: "../assets/images/user.jpg",sender: "me",seen: true ),
  Chat(message: "I am good and you?",time: "11:51 AM",profile: "../assets/images/user.jpg",sender: "John",seen: true ),
  Chat(message: "I am good too Keven.",time: "11:51 AM",profile: "../assets/images/user.jpg",sender: "Jenny",seen: true ),
  Chat(message: "I am good too everyone",time: "11:52 AM",profile: "../assets/images/user.jpg",sender: "me",seen: true ),
  Chat(message: "What are you doing now?",time: "11:52 AM",profile: "../assets/images/user.jpg",sender: "me",seen: true ),
  Chat(message: "I am playing games",time: "11:52 AM",profile: "../assets/images/user.jpg",sender: "Jenny",seen: true ),
  Chat(message: "Me too.",time: "11:52 AM",profile: "../assets/images/user.jpg",sender: "John",seen: true ),
  Chat(message: "Are you playing together?",time: "11:52 AM",profile: "../assets/images/user.jpg",sender: "me",seen: false ),
  
];

Color appbarColor = Color(0xff229ED9);
