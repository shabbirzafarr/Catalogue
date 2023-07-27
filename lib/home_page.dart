import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/cart.dart';
import 'package:hello_world/catalog/catalog.dart';
import 'package:hello_world/widget/drawer.dart';
import 'package:hello_world/widget/item.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var key;
  late String uid;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  // late List<Item> list;
  @override
  void initState() {
    super.initState();
    
    BuildData();
  }
  BuildData () async{
    Future.delayed(Duration(seconds: 5));
     var catalogJson=await rootBundle.loadString("assets/files/catalog.json");
    var decodedData=await json.decode(catalogJson);
    // var ProductData=decodedData(decodedData);
    // print(ProductData);
    Catalog.items=List.from(decodedData).map<Item>((item) => Item.fromMap(item)).toList();
    Catalog.items=Catalog.items;
    User? user=_auth.currentUser;
    uid=user!.uid;
    Future.delayed(const Duration(milliseconds: 500), () {
     
    
    setState(() {
});

});
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Catalog App")),
      ),
      floatingActionButton: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>cart(uid: uid,))),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(60)
          ),
          child: Container(
            decoration: BoxDecoration(color: Color(0xFF004AAD),borderRadius: BorderRadius.circular(50)),
            child: Icon(CupertinoIcons.cart,color: Colors.white,))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (Catalog.items.length==0)?Center(child: CircularProgressIndicator()):ListView.builder(
          itemCount: Catalog.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: Catalog.items[index],
            );
          },
        ),

      ),
      drawer: MyDrawer(),
    );
  }
}
