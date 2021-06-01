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

  //CALENDAR
  Color selected_color = new Color(0xFF856ABE);
  Color focused_color = new Color(0xFFA293C0);

  //BORDER TEMPLATE OF FRIENDS & SUBSCRIBERS
  Color friends_subscribers_border_color = new Color(0xFF664C9E);

  errorFieldAlert(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
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

//PAGES
/* Box Decoration Gradient Background */
final kBoxDecoration_BGPAGES = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFFFFF),
    ],
  ),
);

/* Container Gradient Background */
final kContainer_BGPAGES = Container(
  height: double.infinity,
  width: double.infinity,
  decoration: kBoxDecoration_BGPAGES,
);

// LOGIN
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
SizedBox sizeBox_Spacing(double value) {
  return SizedBox(
    height: value,
  );
}

final navigationButtons = BoxDecoration(
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

final kBoxDecoration_Selection_Button = BoxDecoration(
  color: Colors.white70,
  boxShadow: [
    BoxShadow(
      color: Constants().app_color,
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.circular(18),
);

/* Separator */
Container separator(double value) {
  return Container(
    height: value,
    color: Color(0xFF856ABE),
  );
}

/* Text Style Title */
final textStyle_Title = TextStyle(
  color: Constants().selected_color,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

/* Text Style Title */
final textStyle_Selection_Title = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

/* Text Style Title */
final textStyle_Selection_Button = TextStyle(
  color: Constants().app_color,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

/* Text Style Title */
final textStyle_Desc = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w400,
  fontFamily: 'OpenSans',
);

/* Text Style Title */
final textStyle_Credit = TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.w400,
  fontFamily: 'OpenSans',
);

/* Text Style Title */
final textStyle_Date = TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.w400,
  fontFamily: 'OpenSans',
);

// DETAILED PAGE
/* Text Style Title */
final textStyle_DetailedPage = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w400,
  fontFamily: 'OpenSans',
);

Widget selection_Button(Text str) {
  return Container(
    width: 240,
    height: 50,
    child: Center(
      child: Text(str.data, style: textStyle_Selection_Button),
    ),
    decoration: kBoxDecoration_Selection_Button,
  );
}
