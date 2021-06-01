import 'package:flutter2/Mobile/Tools/Image/ImageProfileFireManager.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'C_Projects.dart';
import '../Constants.dart';

Widget studentName(String id, String name) {
  return FutureBuilder(
      future: locator<ImageProfileFireManager>().getOtherUserPhoto(id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _checkimageprofile(snapshot.data as String),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          );
        }
      });
}

Widget _checkimageprofile(String urlimage) {
  if (urlimage == null || urlimage == "") {
    return Container(
      width: 30,
      height: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Container(
          color: Constants().app_color,
          child: Icon(
            Icons.person,
            size: 200,
            color: Constants().icon_photo_profile,
          ),
        ),
      ),
    );
  } else {
    NetworkImage imageFile = NetworkImage(urlimage);
    return Container(
      width: 30,
      height: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.network(
          imageFile.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

Widget textDPboth_title(Text name, TextStyle style) {
  return Container(
    child: Text(
      name.data,
      style: style,
    ),
  );
}

Widget textDP_elem1(Text name, TextStyle style) {
  return Container(
    child: Text(
      name.data,
      style: style,
    ),
  );
}

Widget textDP_elem2(Text name, TextStyle style) {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
      name.data,
      style: style,
    ),
  );
}
