import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  //instance of auth 
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //sign user in 
  Future<UserCredential> SignInWithEmailandPassword(String email, String password) async{
    try{
      //Sign in 
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password,
        );

        return userCredential;
    }
    //catch any errors 
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }

  }
}