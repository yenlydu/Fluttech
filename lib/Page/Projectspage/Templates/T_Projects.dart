import 'package:flutter/material.dart';

import '../../../Model/Constants.dart';
import '../../../Model/Constants/C_Projects.dart';

class T_Projects extends StatelessWidget {
  const T_Projects({Key key}) : super(key: key);

  // Notifications Template
  @override
  Widget _buildNotificationsTemplate(Text str) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            decoration: kProject_BoxDecorationStyle,
            child: Column(
              children: <Widget>[
                Text(
                  str.data,
                  overflow: TextOverflow.ellipsis,
                  style: kProject_Style,
                ),
                /*
                Text(
                  str.data,
                  style: kProject_Style,
                  overflow: TextOverflow.fade,
                ),*/
              ],
            ),
          ),
          kSizeBox_Space10,
        ],
      ),
    );
  }

  @override
  Widget _test() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              _buildNotificationsTemplate(
                Text(
                    "hvcbdv jrbfd vlidfr jsvbmdi jvblhb milbiu yhvo uby uvr fbjrt nbt boi tbnk fnbihv gyuo vgb"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
