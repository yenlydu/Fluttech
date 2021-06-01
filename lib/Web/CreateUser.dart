import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/RolesDropDown/RolesDropDown.dart';
class CreateUser extends StatefulWidget {
  const CreateUser({Key key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  Roles selectedRole = Roles.STUDENT;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  void getSelectedRole(Roles selectedRole)
  {
    setState(() {
      selectedRole = selectedRole;
      if (selectedRole == Roles.STUDENT) {
        print ("selectedRole " + selectedRole.toString());
      } else if (selectedRole == Roles.TEACHER) {
        print ("selectedRole " + selectedRole.toString());
      } else {
        print ("selectedRole " + selectedRole.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration_BG,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child:             Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(0, 3), blurRadius: 24)
                  ],
                ),
                width: 350,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    Text(
                      "CREATE NEW USER",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Butler"),
                    ),
                    SizedBox(
                      height: 15,
                    ),

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
                            controller: emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                icon: Icon(Icons.email_outlined)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                icon: Icon(Icons.lock)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                icon: Icon(Icons.lock)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                            controller: displayNameController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Displayed Name",
                                icon: Icon(Icons.person)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                            controller: displayNameController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                icon: Icon(Icons.phone)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RolesDropDown(text: "User Role", getUserRole: getSelectedRole,),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("Forgot password?")],
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                        ),
                        child: FlatButton(
                          child: Text("Create",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            if (passwordController.text ==
                                confirmPasswordController.text &&
                                passwordController.text != null &&
                                passwordController.text != "" &&
                                emailController.text != null &&
                                emailController.text != "") {
                              context.read<AuthenticationService>().signUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              emailController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                            } else if (emailController.text == null ||
                                emailController.text == "") {
                              showSimpleNotification(
                                  Text(
                                    "Email can't be empty !",
                                    textAlign: TextAlign.center,
                                  ),
                                  background: Colors.red);
                            } else if (passwordController.text == null ||
                                passwordController.text == "") {
                              showSimpleNotification(
                                  Text(
                                    "Password can't be empty !",
                                    textAlign: TextAlign.center,
                                  ),
                                  background: Colors.red);
                            } else {
                              print([
                                passwordController.text,
                                confirmPasswordController.text
                              ]);
                              showSimpleNotification(
                                  Text(
                                    "The password and confirm password do not match !",
                                    textAlign: TextAlign.center,
                                  ),
                                  background: Colors.red);
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),

            )
          ),
        ),
      ),
    );
  }
}
