import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import '../../../Model/Constants.dart';

class FindUsersPage extends StatefulWidget {
  FindUsersPage();

  @override
  _FindUsersPageState createState() => _FindUsersPageState();

}
class _FindUsersPageState extends State<FindUsersPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(
          ),
        ),
      ),
    );
  }
}