import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> Register(
  String Username,
  String Email,
  String Password,
  BuildContext context,
) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: Password);

    await FirebaseFirestore.instance
        .collection("datas")
        .doc(userCredential.user!.uid)
        .set({"Name": Username, "Email": Email});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User Created successfully")),
    ); //snackbar is used to pop up and pop down fast
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> login(String Email, String Password, BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Email,
      password: Password,
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login Successful")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> forgotp(String Email, BuildContext context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Code sent, Check your Email"),));


  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
