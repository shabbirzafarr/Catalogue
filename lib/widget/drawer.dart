import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/auth/auth.dart';
import 'package:hello_world/home_page.dart';
// import 'package:hello_world/login_page.dart';
import 'package:hello_world/routes.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AuthService _auth=AuthService();
  String? uid="null";
    String? email="null";
  @override
  void initState() {
    // TODO: implement initState
    
    _auth.getCurrentUser().then((user) {
      setState(() {
        uid = user?.uid;
        email = user?.email;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    AuthService _auth=AuthService();
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text(email!.substring(0,email!.length-10),style: TextStyle(color: Colors.white),),
                    accountEmail: Text("$email",style: TextStyle(color: Colors.white),),
                    currentAccountPicture: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/th.jpg'),
                      ),
                    ),
                    )),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, MyRoute.Homepageroutes);
                    //   },
                    //   leading: Icon(
                    //     CupertinoIcons.home,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text("Home",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     CupertinoIcons.profile_circled,
                    //     color: Colors.white,
                    //   ),
                    
                    //   title: Text("Profile",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
                    // ),
                    ListTile(
                      onTap: () {
                        _auth.logout();
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    
                      title: Text("Log-Out",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
                    ),
          ],
        ),
      ),
    );
  }
}
