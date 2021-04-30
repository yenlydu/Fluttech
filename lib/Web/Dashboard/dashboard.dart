import 'package:flutter/material.dart';
import 'package:flutter2/Web/Dashboard/navigationBar.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            NavigationBar(),
          ],
        ),
    );
  }
}
