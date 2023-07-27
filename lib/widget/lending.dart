import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_world/cart.dart';
import 'package:hello_world/widget/add.dart';

import '../catalog/catalog.dart';
class lending extends StatelessWidget {
  final Item items;
  
  const lending({Key? key,required this.items}):assert(items !=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(items.name),)
      ),
      body: Stack(
        
        children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAx,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 5),
              
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child:Hero(
                tag: Key(items.id.toString()),
                child: Image.network(items.image)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                 margin: EdgeInsets.only(top: 10),
                child: Text(items.name,style: TextStyle(fontSize: 30,),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.topCenter,
                 margin: EdgeInsets.only(top: 5),
                child: Text(items.desc,style: TextStyle(fontSize: 22,),),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15,right: 10),
          alignment: Alignment.bottomRight,
          child: Text("\$${items.price.toString()}",style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 30
          ),),
        ),
        Container(
          alignment: Alignment.bottomRight,
          
          width: 200,
          // foregroundDecoration: BoxDecoration(color: Color.fromARGB(255, 25, 47, 109),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          margin: EdgeInsets.only(bottom: 10,left: 10),
          
          // ecoration: BoxDecoration(),d
          child: Expanded(
            child: ElevatedButton(onPressed: () async{
              carts(image: items.image,name: items.name,price: items.price.toInt()).addtocart();
            }, 
            style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)), backgroundColor:MaterialStatePropertyAll(Color(0xFF004AAD),)),
            child: Text("Add to cart"),),
          )
        )
      ],
      
      )
    );
  }
}