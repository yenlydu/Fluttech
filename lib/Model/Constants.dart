import 'package:flutter/material.dart';

// Global Constants (Mostly App Color)
class Constants extends StatelessWidget {
  /////////COLORS
  //GLOBAL
  Color app_color = new Color(0xFF664C9E);
  Color login_app_color = new Color.fromRGBO(86, 0, 232, 1);
  Color facebook_color = new Color(0xFF4267B2);
  Color instagram_color = new Color(0xFF405DE6);
  Color twitter_color = new Color(0xFF1DA1F2);
  Color linkedin_color = new Color(0xFF2867B2);
  Color white_text = new Color(0xFFFFFFFF);
  Color black_text = new Color(0xFF000000);

  //USER PROFILE
  Color bg_image_profile = new Color(0xFF664C9E);
  Color icon_photo_profile = new Color(0xFFFFFFFF);
  Color border_image = new Color(0xFFDADADA);

  //POST
  Color posts_color = new Color(0xFFE0E0E0);

  //BORDER TEMPLATE OF FRIENDS & SUBSCRIBERS
  Color friends_subscribers_border_color = new Color(0xFF0051FF);

  errorFieldAlert(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {Navigator.pop(context); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Fields empty"),
      content: Text("Email or Password incorrect."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  //CHANGE USER LOGIN PAGE
  Widget buttonChangeUserPage(String displayedText, PageRouteBuilder route, BuildContext context) {
    return Center(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),

        color: Colors.white.withOpacity(0),
        onPressed: () => {  Navigator.push(
        context,
        route,
        )
      },
        padding: EdgeInsets.all(8.0),
        child: Column( // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(Icons.person,
              color: Constants().app_color
            ),
            Text(
              displayedText,
              style: TextStyle(
                letterSpacing: 1.5,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,

                color: Constants().app_color,
                fontFamily: 'OpenSans',
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container();
  }
}

//ICON

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF9989BD),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kBoxDecoration_BG = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF664C9E), Color(0xFF9989BD), Color(0xFFFFFFFF)],
  ),
);
