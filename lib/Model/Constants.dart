import 'package:flutter/material.dart';

// Global Constants (Mostly App Color)
class Constants extends StatelessWidget {
  /////////COLORS
  //GLOBAL
  Color app_color = new Color(0xFF664C9E);
  Color login_app_color = new Color(0xFF664C9E);
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
  Color friends_subscribers_border_color = new Color(0xFF664C9E);

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
  @override
  Widget build(BuildContext context) {

    return Container();
  }
}

/* Box Decoration Gradient Background */
final kBoxDecoration_BG = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF664C9E), Color(0xFF9989BD), Color(0xFFFFFFFF)],
  ),
);

/* Container Gradient Background */
final kContainer_BG = Container(
  height: double.infinity,
  width: double.infinity,
  decoration: kBoxDecoration_BG,
);

/* Size Box Space */
final kSizeBox_Space10 = SizedBox(
  height: 10.0,
);

/* Size Box Space */
final kSizeBox_Space20 = SizedBox(
  height: 20.0,
);

/* Size Box Space */
final kSizeBox_Space30 = SizedBox(
  height: 30.0,
);

final  navigationButtons = BoxDecoration(
  color: Colors.white70,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    borderRadius: BorderRadius.circular(18),
);
