import 'package:flutter/material.dart';
import 'package:flutter2/Web/homeAdmin.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../Mobile/Tools/authentication_service.dart';
class LoginP extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final TextEditingController password = TextEditingController();
    final TextEditingController email = TextEditingController();

    return Container(
      decoration: kBoxDecoration_BG,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 3), blurRadius: 24)
                ],
              ),
              height: 450,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: new AssetImage("assets/images/icon.png"),
                    color: null,
                    width: 150,
                    height: 150,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  ),
                  Text("ADMINISTRATOR", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Butler"),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              icon: Icon(Icons.email_outlined)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(Icons.lock_open)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Forgot password?")],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                      ),
                      child: FlatButton(
                          child: Text("Sign in", style: TextStyle(color: Colors.white)),

/*                          onPressed: () {
                          context.read<AuthenticationService>().signIn(
                            email: email.text.trim(),
                            password: password.text.trim(),
                          );
                          }*/
                            // TEXT FOR INVALID LOGIN
                        onPressed:() {
                          if (email.text.isEmpty || password.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email or password")));
                          } else {
                            print(email.text + " "+ password.text);
                            Navigator.push(context,     MaterialPageRoute(
                              builder: (context) => HomeAdmin (email: email.text,)
                            ));
                            //                            Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => FindUsersPage()));
                          }
                        },

                    ),

                      ),
                  ),
                    ],
                    ),
                  ),
              ),
            ),
          ),
        );
  }
}
