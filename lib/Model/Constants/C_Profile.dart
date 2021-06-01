import 'package:flutter/material.dart';

import '../../Mobile/Page/ProfilePage/Profile.dart';
import '../Constants.dart';

final kTextStyle_name = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
);

final kTextStyle_mail = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15.0,
);

//Display icon (Profile image bottom right)
Widget photoicon() {
  return Container(
    width: 50,
    height: 50,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Container(
        color: Constants().app_color,
        child: Icon(
          Icons.photo_camera,
          color: Constants().icon_photo_profile,
        ),
      ),
    ),
  );
}
