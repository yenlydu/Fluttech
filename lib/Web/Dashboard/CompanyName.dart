import 'package:flutter/material.dart';

class CompanyName extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 70.0,
              icon: Image.asset('images/icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}