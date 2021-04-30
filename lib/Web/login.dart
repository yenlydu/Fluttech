import 'package:flutter/material.dart';
import 'package:flutter2/Web/homeAdmin.dart';
import 'package:flutter2/Web/Dashboard/navigationBar.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Mobile/Page/Admin/FindUsersPage/FindUsersPage.dart';
class LoginP extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final password = TextEditingController();
    final email = TextEditingController();

    return Container(

      decoration: kBoxDecoration_BG,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, offset: Offset(0,3), blurRadius: 24
                  )
                ],
              ),
              height: 400,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: new AssetImage("images/icon.png"),
                    color: null,
                    width: 150,
                    height: 150,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  ),
                  Text("ADMIN"),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            icon: Icon(Icons.email_outlined)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(Icons.lock_open)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                      padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot password?")
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                      ),
                      child: FlatButton(
                        onPressed:()
                        {
                          if (email.text.isEmpty || password.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email or password")));
                          } else {
                            print(email.text + " "+ password.text);
                            Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => HomeAdmin()));
//                            Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => FindUsersPage()));
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
