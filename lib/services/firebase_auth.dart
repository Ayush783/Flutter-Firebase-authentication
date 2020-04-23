import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User{
  const User({@required this.uid});
  final String uid;
}

class FirebaseAuthService{
  final _auth = FirebaseAuth.instance;

  User _user(FirebaseUser user){
    return user== null?null:User(uid: user.uid);
  }
  
  Future<User> createUser(String email,String pass) async{
    final createResult = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    return _user(createResult.user);
  }
  
  Stream<User> get onAuthStateChanged{
    return _auth.onAuthStateChanged.map(_user);
  }

  Future<User> signIn(String email,String pass) async{

    final authResult = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return _user(authResult.user);
  }

  Future<void> signOut() async{
    return _auth.signOut();
  }

}