// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_world/data/database.dart';
// import 'package:link/models/user.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  
  // auth cha
  //register with email
  // ignore: non_constant_identifier_names
  Future register(String email,String Password)async{
    try{
      UserCredential result=await (_auth.createUserWithEmailAndPassword(email: email, password: Password));
      User? user=result.user;
      await DatabaseService(uid: user!.uid);
      return "";
    }catch(e){
      return e.toString();
    }
  }
   //log in
  Future LogIn(String email,String password) async{
    try{
      UserCredential user=await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "";
    }catch(e){
      return e.toString().trim();
    }
  }
 

  //log out
  Future logout() async{
    // print(_auth.currentUser);
      _auth.signOut();
  }
  //current user
  Future<User?> getCurrentUser() async {
    return await _auth.currentUser;
}

}
