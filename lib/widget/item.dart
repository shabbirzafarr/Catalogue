import 'package:flutter/material.dart';
import 'package:hello_world/catalog/catalog.dart';
import 'package:hello_world/routes.dart';
import 'package:hello_world/widget/lending.dart';

import 'add.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          isThreeLine: false,
          onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) =>lending(items: item),),),
          
          leading: Hero(
            tag: Key(item.id.toString()),
            child: Image.network(item.image)),
          title: Text(item.name),
          subtitle: Text(
            "\$${item.price}",
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: 
          MaterialButton(onPressed: ()async{carts(image: item.image,name: item.name,price: item.price.toInt()).addtocart();}, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),color: Color(0xFF004AAD),child: Text("Add to Cart",style:TextStyle(
            color: Colors.white
          ),),)
        ),
      ),
    );
  }
}