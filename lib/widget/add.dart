import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/auth/auth.dart';

import '../data/database.dart';
class carts{
  String image,name;
  int price;
  carts({required this.image,required this.name,required this.price}){}
  final FirebaseAuth _auth=FirebaseAuth.instance;
Future<void> addtocart()async{
  User user=_auth.currentUser!;
  await DatabaseService(uid: user.uid).updateCart(image, name, price);
}
}
