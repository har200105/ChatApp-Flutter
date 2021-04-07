import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUsers(String username) async {
    return await FirebaseFirestore.instance
        .collection("chatusers")
        .where("name", isEqualTo: username)
        .get();
  }

  getUsersByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("chatusers")
        .where("name", isEqualTo: email)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("chatusers").add(userMap);
  }

  createChat(String chatroomid, chatRoomMap) {
    FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatroomid)
        .set(chatRoomMap);
  }

  addMessages(String chatroomid, messageMap) {
    FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatroomid)
        .set(messageMap);
  }

  getMessages(String chatroomid) async {
    return await FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatroomid)
        .collection("chat")
        .orderBy("time", descending: false)
        .snapshots();
  }

  getChatRooms(String username) async{
    return await FirebaseFirestore.instance
        .collection("chatroom")
        .where("users", arrayContains: username)
        .snapshots();
  }
}
