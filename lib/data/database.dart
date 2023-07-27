import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class DatabaseService{

  String uid;
  DatabaseService({required this.uid}){}
  final CollectionReference cartitem=FirebaseFirestore.instance.collection('Cart');
  final DatabaseRef=FirebaseDatabase.instance.ref("cart");
  Future updateCart(String image,String name,int price) async{
    DatabaseRef.child(uid).child(name).set({
      'image':image,
      'name':name,
      'price':price
    });
  }
}