import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

SizedBox sizedBox(double size)
{
  return SizedBox(height: size);
}

final hamburgerIcon = Icon(
  Icons.menu,
  color: Colors.deepPurple,
  size: 30.0,
);

String formatter(DateTime dateTime)
{
  return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
}

