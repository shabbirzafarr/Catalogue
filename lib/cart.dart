// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget {
   String uid;

   cart ({super.key,required this.uid});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int price=0;

  final ref=FirebaseDatabase.instance.ref("cart");
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Cart"),),
      body: FirebaseAnimatedList(query: ref.child(widget.uid),defaultChild: Center(child: CircularProgressIndicator()), itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index){
            price+=int.parse(snapshot.child('price').value.toString());
            
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                
                leading: Image.network(snapshot.child('image').value.toString()),
                title: Text(snapshot.child('name').value.toString()),
                subtitle: Text(
                      "\$${snapshot.child('price').value.toString()}",
                      style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
                      ),),
                      trailing: InkWell(onTap: (){print(price);
                      try{
                        // price=price-int.parse(snapshot.child('price').value.toString());
                        ref.child(widget.uid).child(snapshot.child('name').value.toString()).remove();
                        setState(() {
                          
                        });
                      }
                      catch(e){print(e.toString());}
                      }, child: Icon(Icons.delete,color: Colors.red,)),
              ),
            );
          }),
          
    );
  }
}