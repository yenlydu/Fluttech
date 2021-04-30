import 'package:flutter/material.dart';

class CompanyName extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset('images/icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}