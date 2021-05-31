import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final hamburgerIcon = Icon(
  Icons.menu,
  color: Colors.deepPurple,
  size: 30.0,
);

String formatter(DateTime dateTime)
{
  return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
}

Widget buildingScrollView({BuildContext context, double width, double height, Widget child})
{
  return Container(
    width: width,
    height: height,
    child: SingleChildScrollView(
      child: Column(
        children: [
              child
          ],
      ),
    ),
  );

}

Widget buildingSingleItemConstant({BuildContext context, Widget onTapPopup, Widget itemDisplay, String firebaseModuleId})
{
  return InkWell(
    hoverColor: Colors.transparent,
    onTap: ()=> {
      if (firebaseModuleId != null) {
        Navigator.pushReplacementNamed(
          context,
          '/handleUnits/' + firebaseModuleId ,
        ),
      } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return onTapPopup != null ? onTapPopup : Container();
          })
      }
    },
    child: Container(
      width: MediaQuery.of(context).size.width/1.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  Color(0xFFF7F8F8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            offset: Offset(0.5,0.5),
            blurRadius: 2,
          )
        ]
      ),
      child: itemDisplay,
    ),
  );
}
