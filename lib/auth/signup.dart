import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/auth/auth.dart';
import 'package:hello_world/auth/login.dart';
class SignUp extends StatefulWidget {
  
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // bool logs=true;
  // FirebaseAuth _auth=FirebaseAuth.instance;
  TextEditingController pass=TextEditingController();
  TextEditingController email=TextEditingController();
  AuthService _auth=AuthService();
  bool con = false;
  bool logs=false;
  String error="";
  final _form_key = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_form_key.currentState!.validate()) {
      con = true;
      setState(() {});
      error=await _auth.register(email.text.trim(),pass.text.trim());
      setState(() {
        con = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return (!logs)?Material(
      color: Colors.white,

      child: SafeArea(
        child: Form(
          key: _form_key,
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  InkWell(
                    onTap: (){logs=!logs;setState(() {});},
                    child: AnimatedContainer(
                      height: 50,
                      width: 100,
                      duration: Duration(seconds: 1),
                      decoration: (logs)?BoxDecoration(color: Color(0xFF004AAD),borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0))):BoxDecoration(color: Color.fromARGB(255, 197, 214, 234),borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("LogIn"),) ,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){logs=!logs;setState(() {
                    });},
                    child: AnimatedContainer(
                      height: 50,
                        width: 100,
                        duration: Duration(seconds: 1),
                        decoration: (!logs)?BoxDecoration(color: Color(0xFF004AAD),borderRadius: BorderRadius.only(topRight: Radius.circular(8.0),bottomRight: Radius.circular(8.0))):BoxDecoration(color: Color.fromARGB(255, 197, 214, 234),borderRadius: BorderRadius.only(topRight: Radius.circular(8.0),bottomRight: Radius.circular(8.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Sign-Up")),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "Join us!",
                style: TextStyle(
                  fontSize: 28,
                  //color: Colors.blue
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password cannot be empty";
                        } else if (value.length < 6) {
                          return "Passsword too short";
                        }

                        return null;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width:  350,
                  alignment: Alignment.center,
                  child: (con)
                      ? Center(child: CircularProgressIndicator(color: Colors.white,),)
                      : Text(
                          "register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                  decoration: BoxDecoration(
                    color: Color(0xFF004AAD),
                    borderRadius: BorderRadius.circular(con ? 50 : 8.0),
                  ),
                ),
              ),
              Text(error,style: TextStyle(color: Colors.red),)
            ],
          ),
        ),
      ),
    ):LogIn();
  }
}