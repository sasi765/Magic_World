import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {
  static removeFirebaseToken() async {
    User user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection("user")
        .doc(user.uid)
        .update({'firebaseToken': ''});
  }

  static updateFirebaseToken() {}
}
