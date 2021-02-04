import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String user;
  String userName;

  UserData({this.user, this.userName});

  Future<void> userDataFromSnapshot() async {

Firestore.instance.collection('UserData').document(user).get().then((doc) {
  print(doc.data['userName']);
    userName = doc.data['userName'];
});
      
}
}