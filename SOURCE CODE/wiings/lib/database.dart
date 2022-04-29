import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final user = FirebaseAuth.instance.currentUser!;
bool checkplan = false;
List<String> planinfo = ['b', 'a', 'e'];
var uname, email, phonen;
String via = "none";
String signin = 'No';

class FireStoreDataBase {
  List userList = [];
  final uid = FirebaseAuthWeb.instance.currentUser!.uid;

  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("users");

  Future<void> addUser() async {
    // await printDocID();
    //creates a new doc with unique doc ID
    collectionRef
        .doc(uid)
        .set({
          'uid': user.uid,
          'Email id': user.email == null ? 'User@nirvana.com' : user.email,
          'Username':
              user.displayName == null ? 'User@nirvana' : user.displayName,
          'Phone Number':
              user.phoneNumber == null ? '0000000000' : user.phoneNumber,
          'Via': via,
          'Trial': '3',
        })
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
    collectionRef.doc(uid).collection('payment').add({});
    return;
  }
}
