import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _auth = FirebaseAuth.instance;


//login function
  void signIn(String email, String password) async {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Fluttertoast.showToast(msg: "Login Successful");
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const HomeScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Fluttertoast.showToast(msg: 'No User found for that Email');
        } else if (e.code == 'wrong-password') {
          Fluttertoast.showToast(msg: 'Wrong Password ');
        }
      }
    
  }